#!/bin/bash
DownloadAndConvert() {
	echo Avvio...
	echo Importo URLs da files...
	echo creo lista unificata...
	cd $HOME/Dropbox/URLs/
	count=`ls -1 2>/dev/null | wc -l`
	YTBSTR="https://www.youtube.com/watch?v="
	empty_list=`cat 2>/dev/null mergedList | wc -l`
	if [ "$count" != 0 ]; then
		rm 2>/dev/null mergedList 
		touch mergedList
		for filename in *.txt; do
			echo "$YTBSTR$(basename ./$filename .txt)"
			echo "$YTBSTR$(basename ./"$filename" .txt)" >> mergedList
			rm ./"$filename"
		done
		download
		cleanup
	elif [ -e mergedList && $empty_list ]; then
		echo La lista è già presente! - Procedo...
		download
		cleanup
	else
		echo Non ci sono video! - Esco
		exit
	fi
}
download() {
	echo Inizio Scaricamento...
  cd $HOME/Temp\ Music/
	youtube-dl -x -a "mergedList" --no-playlist
}

cleanup() {
	echo Pulisco lista...
  cd $HOME/Dropbox/URLs/
	rm mergedList
	echo FINE
}

trap exit SIGINT
DownloadAndConvert
