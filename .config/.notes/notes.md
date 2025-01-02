# Notes

## Break-Fix

### Gnome freezes
https://wiki.archlinux.org/title/GNOME/Troubleshooting
`pkill -HUP gnome-shell`


```
sudo dnf install zsh git gpg pass
```
# Gnome Extensions
# https://extensions.gnome.org/extension/615/appindicator-support/
# 
# https://www.atlassian.com/git/tutorials/dotfiles

```
mkdir ~/.cfg
echo ".cfg" >> ~/.gitignore
config() { git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@" }
git clone --bare https://github.com/JacobLChrzanowski/dotfiles.git $HOME/.cfg
config config --local status.showUntrackedFiles no
config checkout --force
```

# Set up gpg
```
export GCM_CREDENTIAL_STORE=gpg
git config --global credential.credentialStore=gpg
```
# Generate a new GPG key
`gpg --gen-key`
# Take the public key ID
`pass init <gpg-id>`

# Login using a new personal access token
# https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

#####
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github
# https://github.com/git-ecosystem/git-credential-manager/blob/main/README.md
# https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md
# https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/credstores.md

##
- openssh-server
- rustup (cargo)
    - zoxide


# --
Things that need to fixed on fedora
- look into more window compositors
- neovim clipboard broken

