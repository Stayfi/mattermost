#!/bin/sh

MM_LISTEN_PORT=${MM_LISTEN_PORT:-8065}
MM_DB_USER=${MM_DB_USER:-stayfi}
MM_DB_PASSWORD=${MM_DB_PASSWORD:-mattermost}
MM_DB_HOST=${MM_DB_HOST:-db}
MM_DB_PORT=${MM_DB_PORT:-3306}



sed -Ei "s/MM_LISTEN_PORT/$MM_LISTEN_PORT/" /mattermost/config/config.json
sed -Ei "s/DB_USER/$MM_DB_USER/" /mattermost/config/config.json
sed -Ei "s/DB_PASSWORD/$MM_DB_PASSWORD/" /mattermost/config/config.json
sed -Ei "s/DB_HOST/$MM_DB_HOST/" /mattermost/config/config.json
sed -Ei "s/DB_PORT/$MM_DB_PORT/" /mattermost/config/config.json

exec /mattermost/bin/platform -config=/mattermost/config/config.json