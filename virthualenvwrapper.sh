function workhon(){ source $HOME/.virthualenv/$1/.virthualenv/bin/activate; }

function mkvhenv(){ 
    mkvirthualenv $1;
    workhon $1;
}

