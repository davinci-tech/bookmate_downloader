#/bin/env zsh

set -x

### Provide to $1 the path to the ebook you want to repair

# Create a temporary directory where I will store the unzipped book and some other data
tmp=$(mktemp -d)
dir=$(realpath $1)

# Unzip the book into tmp and navigate there
unzip $1 -d $tmp
cd $tmp

# Cleanup the html files with HTML Tidy (use brew install tidy-html5)
tidy -numeric -bare -asxml -m */**.html

# Zip the book
zip -Xr repaired.$1 mimetype META-INF OEBPS

# Overwrite the original book with the repaired one
mv repaired.$1 $dir
