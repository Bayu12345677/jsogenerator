#!/bin/bash

. $(pwd)/lib/moduler.sh

# depencies
Bash.import: urlib/urlparser text_display/IO.ECHO text_display/colorama
Bash.import: util/IO.FUNC util/IO.SYSTEM.var util/IO.SYSTEM.VAR fake_useragent/HTTP.UA

# warna (colors)
bi=$(mode.bold: biru)    cy=$(mode.bold: cyan)
ij=$(mode.bold: hijau)  hi=$(mode.normal: hitam)
me=$(mode.bold: merah)  un=$(mode.bold: ungu)
ku=$(mode.bold: kuning) pu=$(mode.bold: putih)
m=$(mode.bold: pink)    st=$(default.color)


# comptimise the screen
stty sane
shopt -s checkwinsize

# system banner
def: banner(){
	stty sane
	printf "${cy}"
	printf '┌──────────────────────────────────────────────────────────────────────┐\n'
	printf '│       _                                                __            │\n'
	printf '|      (_)________     ____ ____  ____  ___  _________ _/ /_____  _____│\n'
	printf '│     / / ___/ __ \   / __ `/ _ \/ __ \/ _ \/ ___/ __ `/ __/ __ \/ ___/│\n'
	printf '│    / (__  ) /_/ /  / /_/ /  __/ / / /  __/ /  / /_/ / /_/ /_/ / /    │\n'
	printf '│ __/ /____/\____/   \__, /\___/_/ /_/\___/_/   \__,_/\__/\____/_/     │\n'
	printf '│/___/              /____/                                             │\n'
	printf '└──────────────────────────────────────────────────────────────────────┘\n'
	printf "${st}"
	Tulis.strN "${ku}[${ij}•${me}•${ku}]${pu} language : Bash (Bourne again shell)"
	Tulis.strN "${ku}[${ij}•${me}•${ku}]${pu} Team     : Im'back crew"
	Tulis.strN "${ku}--------------------------------------------------------------"
	Tulis.strN "${cy}[${ku}•${me}•${ij}•${cy}]${pu} Author : polygon"
	Tulis.strN "${cy}[${ku}•${me}•${ij}•${cy}]${pu} github : github.com/Bayu12345677"
	Tulis.strN "${cy}[${ku}•${me}•${ij}•${cy}]${pu} tools  : generate jso"
	Tulis.strN "${ku}--------------------------------------------------------------${st}"
};

# pantesbin
def: pantesbin(){
	global: index = "$1";
	global: key = "$2";
	global: dev = "$3";

	# get index
	echo "$index" > jso.tmp
	
	# data request
	declare data=(
				"api_paste_format=javascript"
				"api_option=paste"
				"api_user_key=${key}"
				"api_paste_private=0"
				"api_paste_name=$(shuf -i 0-1000 -n 1)"
				"api_paste_expire_date=N"
				"api_dev_key=${dev}"
				"api_paste_code=$(cat jso.tmp)"
				)

	var uri : "https://pastebin.com/api/api_post.php"; {
		curl -s -L -A "$(Bash::Ua.Random)" --url "${uri}" -X POST --data "${data[0]}" -d "${data[1]}" -d "${data[2]}" -d "${data[3]}" -d "${data[4]}" -d "${data[5]}" -d "${data[6]}" -d "${data[7]}" --insecure --compressed
	};
};

# create index
def: index.app(){
	String_Text="$1"

	# system index
	function __create__ {
		# convert to ascii
		__ascii__=$(@ord "${1}" | sed -e 's;[[:space:]];, ;g')
		
		# create index jso
		Tulis.strN "document.documentElement.innerHTML=String.fromCharCode(${__ascii__})"
	};
	  jso_index=$(__create__ "${String_Text}")
};

# composing components
def: model(){
		global: plontos = "$1";
		global: opsi_1 = "$2";
		global: opsi_2 = "$4";

		# cek variable di atas
		if [[ $(echo ${opsi_1}) == key ]]; then
			global: value_1 = "$3"
		fi
		# cek kedua
		if [[ ${opsi_2} == dev ]]; then
			global: value_2 = "$5"
		fi;
			@ satu ps 5 gas elpiji eksekusi
		index.app "${plontos}";
		pantesbin "${jso_index}" "${value_1}" "${value_2}";
};

def: main(){
	var=$(banner); clear

	# Later here is the determination of the wearer's limit (nanti ini sebagai limit nya)
	# If all limits you can list to pastebin to get your key so that tools can be used well
	# (ntar jika semua key ini limit bisa kalian ganti menggunkan key kalian sendiri agar tools bisa di gunakan dengan baik)
	var key_1 : "765d5bc85b61996a34034d2ce40e3994";
	var key_2 : "3e74028810d51103a9b21884fc5f4f9e";
	var dev_1 : "aXRNBv4Vy4PN6duRNEIuTslLzXLt-HgD";
	var dev_2 : "dzxq1yufRgqc4AUmNd9WNxZ7avMBG6Jj";
	# cara dapet key nya kalian bisa login di pastebin
#	var j : 0
#	jumlah_ban=${#var}
#	while ((j<=100)); do
#		n=$((j*jumlah_ban / 80));
#		printf "\r%-${jumlah_ban}s" "${var:0:n}"
#		sleep 0.01s
#		((j += $RANDOM % 2))
#	done; sleep 0.01s; clear; sleep 01s; banner; sleep01s; clear; sleep 01s; shopt -s checkwinsize; stty sane; banner;echo;
  stty sane -echo; shopt -s checkwinsize
	banner; echo
	Tulis.str "${ku}[${cy}•${me}•${ku}]${pu} masukan disini ${me}:${st} "
	read input
		echo

	if [[ -z "$input" ]]; then
		__e__="Input not found"; throw; exit 22
	fi; tput civis
		iframe="123456789 "
		for run in {1..7}; do
			for ((j = 0; j < ${#iframe}; j++)); do
				delay: 0.1s
				Tulis.str "\r${cy}[${me}•${ij}•${cy}]${pu} mengconvert ${ku}[${ij}${iframe:j:1}${ku}]${st}"
			done
		done; echo; echo; {
			if [[ ! -f "${input}" ]]; then
				index_nya="$input"
			else
				index_nya=$(cat ${input})
			fi
			convert_input=$(@ord "${index_nya}")
		}; if [[ ! -f "$input" ]]; then println_info " successfully in convert [$(echo $convert_input | sed -e 's;[[:space:]];, ;g')]"; else println_info " done convert [save as convert.tmp]"; fi;
			echo "${convert_input}" | sed 's/[[:space:]]/, /g' >> convert.tmp
		Tulis.str "\e[41;1;97mcreate\e[0m";
		read ct;
		println_info " upload to pastesbin\n"
			for ((i=0;i<=100;i++)); do
				delay: 0.1s
				Tulis.str "\r${cy}[${ij}•${ku}•${me}•${cy}]${pu} processing ${un}[${ij}${i}${un}]${st}"
				if ! (curl -s google.com &> /dev/null); then
					echo
					println_info " internet not found ${me}(${pu}process fail${me})${st}"
					exit 23
				fi
			done;
					if [[ ! -f "${input}" ]]; then
						# println_info " successfully in convert [$(echo '${convert_input}' | sed -e 's;[[:space:]];,;g')]"
						var::command link_uri = model "${input}" key "$key_1" dev "$dev_1"
						# cek found key
						if [[ $(echo "$link_uri" | grep -o 'http') == http || $(echo "${link_uri}" | grep -o 'https') == https ]]; then
							tumbal_proyek=""
						else
							link_uri=$(model "$input" key "$key_2" dev "$dev_2")
						fi
					else
						link_uri=$(model "$(echo \"$(cat $input)\")" key "$key_1" dev "$dev_1")
						# cek limit
						if [[ $(echo "${link_uri}" | grep -o 'http') == http || $(echo "${link_uri}" | grep -o 'https') == https ]]; then
							tumbal_proyek=""
						else
							link_uri=$(model "$(echo \"$(cat $input)\")" key "$key_2" dev "$dev_2")
						fi
					fi;
						IFS= command eval echo; echo; println_info " done"; echo; println_info " result -> ${ku}${link_uri}${st}";
						echo "${link_uri}" >> jso.tmp; println_info " done (result : jso.tmp)\n"; tput cnorm
		
};

def: sys.trap(){
	echo; echo
	println_info " Ctrl has been depressed"
	println_info " out of tools\n"
	exit 2
}; trap sys.trap INT SIGINT
begin:
	var::command this = IO.func
		 (
		 	$this.NAME main && IFS= command eval main
		 )
__bash__
