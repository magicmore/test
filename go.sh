#!/bin/bash

if equal a b
then
    echo yiyang
else
    echo buyiyang
fi

equal()
{
    case "$1" in
    "$2")
        echo yiyang
        return 0
        ;;
    *)
        echo buyiyang
        return 1
    esac
}


