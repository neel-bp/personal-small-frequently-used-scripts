*smoll python scripts*
==============================================================================
for my daily use python scripts, check my other branch of same repo,
python-scripts

*bulk rename notes*
==============================================================================
- for bulk rename the default editor is vim with "-u NONE" optional arguments
(since vim is used as default editor obviously you must have vim in your
path)
- for using the editor of your choice, you can easily specify it with
"-editor" flag (obviously whatever editor you want to use, must be in your
path) i.e bulkrename -editor subl
- for editor optional arguments (-u NONE) you can supply those optional
arguments to the editor like shown below:
																
		bulkrename -editor vim -editorArgs "-u","NONE"

- temporary files that are created in process of bulkrenaming, for them i have
used utf8 BOM encoding because to use regular utf-8 encoding in powershell
scripts you have to use .net core
which i decided not to play with, in most of the cases the special characters
that are displayed in the start of the file because of this BOM encoding don't
even show up, they only become a hassle
when renaming files with special utf8 and unicode characters, if you happen to
use bulkrename with filenames with special characters, most modern texteditors
will show 3 special characters, at the
start of the file, leave them as they are, and there will be no problems.

*full prompt*
==============================================================================
- fullprompt.psm1 just a simple module i wrote for my own powershell prompt,
it doesn't offer any configuration, i just uploaded it for keepsake, you can
use it if you want, its pretty safe explanatory.
- uses nerdfonts for displaying special characters
