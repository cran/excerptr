#!/usr/bin/env python3
# @file
# module functions
#


from __future__ import print_function
import re
import os


## @brief     Extract Matching Lines
#
#    Extract all itmes starting with a combination of comment_character and
#    magic_character from a list.
#
#
# @param		lines	A list containing the code lines.
# @param		comment_character	The comment character of the language.
# @param		magic_character	The magic character marking lines as excerpts.
# @param		allow_pep8	Allow for a leading comment character and space to confrom
#        to PEP 8 block comments.
# @return
#         A list of strings containing the lines extracted.
#

def extract(lines, comment_character, magic_character, allow_pep8=True):
    matching_lines = []
    if allow_pep8:
        # allow for pep8 conforming block comments.
        markdown_regex = re.compile(r"\s*" + comment_character + "? ?" +
                                    comment_character + "+" + magic_character)
    else:
        markdown_regex = re.compile(r"\s*" +
                                    comment_character + "+" + magic_character)
    for line in lines:
        if markdown_regex.match(line):
            matching_lines.append(line)
    return matching_lines


## @brief     Convert Lines to Markdown
#
#    Remove whitespace and magic characters from lines and output valid
#    markdown.
#
#
# @param		lines	The lines to be converted.
# @param		comment_character	The comment character of the language.
# @param		magic_character	The magic character marking lines as excerpts.
# @param		allow_pep8	Allow for a leading comment character and space to confrom
#        to PEP 8 block comments.
# @return
#        A list of strings containing the lines converted.
#

def convert(lines, comment_character, magic_character, allow_pep8=True):
    converted_lines = []
    for line in lines:
        line = line.lstrip()
        if allow_pep8:
            # allow for pep8 conforming block comments.
            line = re.sub(comment_character + " ", "", line)
        # remove 7 or more heading levels.
        line = re.sub(comment_character + "{7,}", "", line)
        line = line.replace(comment_character, "#")
        if magic_character != "":
            # remove the first occurence of the magic_character only
            # (the header definition of pandoc's markdown uses the
            # percent sign, if that was the magic pattern, all pandoc
            # standard headers would end up to be simple text).
            line = re.sub(magic_character, "", line, count=1)
            # get rid of leading blanks
            line = re.sub(r"^\s*", "", line)
        # empty lines (ending markdown paragraphs) are not written by
        # file.write(), so we replace them by newlines.
        if line == " " or line == "":
            line = "\n"
        converted_lines.append(line)
    return converted_lines


## @brief     Extract and Convert Matching Lines
#
#    Just a wrapper to extract() and convert().
#
#
# @param		lines	A list containing the code lines.
# @param		comment_character	The comment character of the language.
# @param		magic_character	The magic character marking lines as excerpts.
# @param		allow_pep8	Allow for a leading comment character and space to confrom
#        to PEP 8 block comments.
# @return
#        A list of strings containing the lines extracted and converted.
#

def excerpt(lines, comment_character, magic_character, allow_pep8=True):
    lines_matched = extract(lines=lines,
                            comment_character=comment_character,
                            magic_character=magic_character)
    converted_lines = convert(lines=lines_matched,
                              comment_character=comment_character,
                              magic_character=magic_character,
                              allow_pep8=allow_pep8)
    return converted_lines


## @brief     Modify a Path
#
#    Add a postfix and a prefix to the basename of a path and change
#    it's extension.
#
# @param		file_name	The file path to be modified.
# @param		postfix	Set the output file postfix.
# @param		prefix	Set the output file prefix.
# @param		extension	Set a new file extension.
# @param		output_path	Set a new file name or an output directory. If the path
#        given is not an existing directory, it is assumed to be a file path and
#        all other arguments are discarded.
# @return
#        A string containing the modified path.
#

def modify_path(file_name, postfix="", prefix="", output_path="",
                extension=None):
    if output_path != "" and not os.path.isdir(output_path):
        name = output_path
    else:
        base_name = os.path.basename(os.path.splitext(file_name)[0])
        ext_base_name = prefix + base_name + postfix
        if extension is None:
            extension = os.path.splitext(file_name)[1]
        ext = extension.lstrip(".")
        if output_path == "":
            directory = os.path.dirname(file_name)
        else:
            directory = output_path
        name = os.path.join(directory, ext_base_name) + "." + ext
    return name
