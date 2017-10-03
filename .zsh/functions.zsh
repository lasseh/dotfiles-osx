cd() {
  builtin cd $@; ls
}

function jcurl() {
	curl -s "$1" | jq
}

