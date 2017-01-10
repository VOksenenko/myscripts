#!/bin/bash
while :
do
    # цикл для создания 5 архивов
    for n in {1..5} 
    do
            # делаем 5 записей в PS.log с интервалом в 10 с. Для удобства записи разделяем датой.
	    file=PS.log
	    for i in {1..5}
	    do
		echo `date` >> "$file"
		ps >> "$file"
		sleep 10
		echo created line "$i"
	    done
	tarball="PS.log$n.gz"
	# проверяем существует ли архив с таким именем. Если да, удаляем его.
	if 
	[[ -f "$tarball" ]]
	then
	    rm -f "$tarball"
	    echo Архив "$tarball" удален.
	fi	
    gzip -c "$file" > "$tarball"
    echo Создан архив "$n"
    rm "$file"
    done
done
