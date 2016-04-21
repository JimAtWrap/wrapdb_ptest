#!/bin/bash
set -x 

su - postgres -c "/usr/lib/postgresql/9.4/bin/postgres -D /postgres/data"