#/bin/env zsh

### Provide the Book ID of the book you want to download from bookmate (the book id is a 8-alphanumerical code which you can find in the URL of the book)

docker run -it --mount type=bind,source=$(pwd),target=/mnt/data bookmate_dl --bookid $1 --log DEBUG --outdir /mnt/data
