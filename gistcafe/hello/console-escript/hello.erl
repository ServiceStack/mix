-module(hello).
-export([main/1]).

main(_Args) ->
    io:format("Hello World\n"),
    erlang:halt(0).
