#!/bin/bash
function readNum() {
    read -p "" num
}
#while the number entered by the user is not 42
while ((num != 42))
do
    #call the readNum function each time
    readNum
    #this is the killswitch of the program
    if (($num == 42)) 
    then
        exit
    fi 
done
#this program works even if you enter an expression that eventually brings out 42 
#try entering 84/2 or something like 40+2
#maybe there is a better way of doing this