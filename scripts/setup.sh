#! /bin/bash

# pull pulls the master branch of the given repo.
# Prompts user for manual action if another branch is checked out or a problem occurs.
# $1 - name of the repo to pull.
function pull() {
  local repo=$1

  pushd "${repo}"

  local branch=`git rev-parse --abbrev-ref HEAD`
  if [ $branch == "master" ]; then
    echo "Pulling ${repo}/master..."
    git pull origin master || read -p "Could not pull ${repo}/master. Fix the issue and press ENTER to continue:"
  else
    echo "${repo}/${branch} is checked out"
    read -p "Pull ${repo} manually now or press ENTER to skip:"
  fi

  popd
}

# getServices clones or pulls the services with separate repos
# in ${GOPATH}/src/bitbucket.scalefocus.com/go.
function getServices() {
  local CRYPTO_SERVICES_DIR="${GOPATH}/src/bitbucket.scalefocus.com/go"
  mkdir -p "${CRYPTO_SERVICES_DIR}" && cd "$_"

  local services=(
    "cryptofeed"
    "cryptocache"
  )

  for repo in ${services[@]}; do
    echo

    if [ -d "${repo}" ]; then
      pull $repo
      continue
    fi

    echo "Cloning $repo repository to $CRYPTO_SERVICES_DIR..."
    git clone "ssh://git@bitbucket.scalefocus.com:7999/go/${repo}.git"
    pushd "${repo}" && git config user.email "${email}" && popd
  done
}

getServices

echo
echo "All repos fetched successfully"
