#удаляет временные файлы в папке
echo -n  "Введите адрес директории: "
read dir
echo " Удаляю временные файлы в директории $dir ... "
a=`ls -1 $dir |grep -E "~$" `
rm -rf $a

