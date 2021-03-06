function ec2 () {
  local selected_instance
  local private_ip
  local public_ip
  selected_instance=$(aws ec2 describe-instances \
    | jq '.Reservations | [.[] | .Instances] | flatten | [.[] | {Tags: [.Tags[]? | select(.Key == "Environment" or .Key == "Name") | .Value ] | sort, PrivateIpAddress, PublicIpAddress, InstanceId, ImageId, InstanceType}] | .[]' -c \
    | sort -u \
    | fzf --sync --preview "echo {} | jq ." --preview-window 'up:40%')

  private_ip=$(echo $selected_instance | jq -r .PrivateIpAddress)
  ip=$(echo $selected_instance | jq -r .PublicIpAddress)

  if [[ "$ip" == "null" ]]; then
    ip=$private_ip
  fi

  ssh_host=ssh.insided.com
  if [[ $AWS_DEFAULT_REGION = 'us-west-2' ]]; then
    ssh_host=ssh-us-west-2.insided.com
  fi

  ssh -tA "$ssh_host" -- ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$ip"
}

# [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

source /usr/bin/aws_zsh_completer.sh
