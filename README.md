## Introdution ##

MuttMailer is a script collection that I wrote to easily set up mass mailing jobs.

## Usage ##

Basic usage flow is like this:

Setup the account (only first time):

	$ cp muttrc.template muttrc
	$ vi muttrc

Create a directory for your mail:

	$ mkdir mails/test/attach

Put a subject in:

	$ echo "Important mail!" > mails/test/body

Mark the directory as the current email.

	$ ./current.sh mails/test

Write a body

	$ vi mails/test/body

Put the attachments inside `mails/test/attach` if needed.

Edit recipient list:

	$ vi mails/test/list

Test your setup:

	$ ./test.sh

Go one and start mailing:

	$ ./send.sh

or schedule it:

	$ ./at.sh 22:30

## Scripts ##

* `./current.sh` - set the current mail directory
* `./test.sh` - see how your mailing is going to look like
* `./send.sh` - start mailing
* `./at.sh` - schedule the mailing
* `./tools/format-list.sh` - use this tool to prepare recipient lists

## Pitfalls ##

* Only one scheduled job is possible at the moment.
* Lists format is very strict and should really be prepared by `format-list.sh` tool.
