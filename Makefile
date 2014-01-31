.PHONY: all compile test dialyzer clean distclean doc

all: compile test
	@rebar compile

compile:
	@rebar compile

test:
	@rebar eunit skip_deps=true

dialyzer:
	@dialyzer -Wunderspecs -r ebin

doc:
	@rebar doc skip_deps=true

clean:
	@rebar clean

distclean: clean
	@rebar delete-deps

demo_shell: compile test
	@erl -pa .eunit ebin -config pooler-example -s pooler manual_start
