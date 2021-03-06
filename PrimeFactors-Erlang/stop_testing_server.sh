#!/bin/sh

# erl -sname tom -eval "rpc:call(forge@$HOST, testing_server, stop, [])." \
#  -eval "rpc:call(forge@$HOST, init, stop, [])." \
#  -s init stop

if [ -f ERLANG_TESTING_SERVER ]; then
    PID=`cat ERLANG_TESTING_SERVER`
    OLD_SERVER_INFO=`ps -p $PID | grep /erl$`
    if [ "$OLD_SERVER_INFO" ]; then
        kill -9 $PID
        echo "Testing Server stoped (PID: $PID)."
    fi
    rm ERLANG_TESTING_SERVER
    rm log.txt
fi
