{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c77b5d162e62df170fec307e83f1812d94b.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
	pkgs.wget
  	pkgs.ruff
	(pkgs.python3.withPackages (ps: [
		ps.pytest	
	]))
	pkgs.postgresql
  ];

  shellHook = ''
    export PGDATA=$PWD/.env/data/postgres_data
    export PGHOST=$PWD/.env/data/postgres
    export LOG_PATH=$PWD/.env/data/postgres/LOG
    export PGDATABASE=postgres
    export DATABASE_URL="postgresql:///postgres?host=$PGHOST"
    if [ ! -d $PGHOST ]; then
      mkdir -p $PGHOST
    fi
    if [ ! -d $PGDATA ]; then
      echo 'Initializing postgresql database...'
      initdb $PGDATA --auth=trust >/dev/null
    fi
    pg_ctl start -l $LOG_PATH -o "-c listen_addresses= -c unix_socket_directories=$PGHOST"
    trap "'pg_ctl' stop --silent -W" EXIT
  '';

}

