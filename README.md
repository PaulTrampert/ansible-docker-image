# ansible-docker-image
Image containing ansible for use as an ansible control agent.

## Run playbook from mounted volume
`docker run --name ansible -v /my/playbook/root/:/root/playbook/ paultrampert/ansible-docker-image`

## Run playbook from git repo
`docker run --name ansible -e GIT_REPO=https://github.com/Me/my-playbook.git paultrampert/ansible-docker-image`

## Notes
SSH keys can be mounted to `/root/.ssh/`.

The built in entrypoint.sh will take care of installing playbook dependencies before running your playbook, as long as the CMD starts with `ansible-playbook`.
