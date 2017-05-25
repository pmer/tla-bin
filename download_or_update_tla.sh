#!/bin/bash
#
# Downloads the TLA+ binary image (tla.zip) from the Microsoft Research
# servers. If the file already exists locally, checks for an update & prints a
# message if one was found. Converts the zip to a jar.
#

download() {
	if type curl > /dev/null 2>&1; then
		download_curl "$1"
	else
		echo "Couldn't find curl" >&2
	fi
}

download_curl() {
	local if_modified

	if [ -e tla.zip ]; then 
		if_modified="-z tla.zip"
	fi

	curl -f -Ss -R -O $if_modified "$1"

	if [ $? -ne 0 ]; then
		echo "Couldn't download tla.zip"
		exit 1
	fi
}

make_jar() {
	if [ ! -e tla.zip ]; then
		echo "Couldn't find tla.zip"
		exit 1
	fi

	rm -f tla.jar

	# Take everything in the zip out of the tla/ directory.
	unzip tla.zip >/dev/null
	(cd tla; zip -r ../tla.jar * >/dev/null)

	touch -r tla.zip tla.jar

	rm -rf tla
}

print_version() {
	java -cp "$1" tlc2.TLC | grep Version | cut -d' ' -f3
}

main() {
	echo "Downloading tla.zip..."
	before=$(date -r tla.zip 2>/dev/null)
	download https://tla.msr-inria.inria.fr/tlatoolbox/dist/tla.zip
	after=$(date -r tla.zip 2>/dev/null)

	if [ ! -e tla.zip ]; then
		echo "Couldn't download tla.zip" >&2
		exit 1
	fi

	if [ "$before" != "$after" ]; then
		echo "Creating tla.jar..."
		make_jar

		if [ -n "$before" ]; then
			echo "Updated tla.jar"
			printf "New version: "
			print_version tla.jar
		else
			echo "Created tla.jar"
		fi
	else
		echo "No updates"
	fi
}

main
