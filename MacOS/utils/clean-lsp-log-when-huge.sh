nvim_log_path=$HOME/.local/state/nvim/
# echo $filename

find $nvim_log_path -name "*.log" -size +20M -exec rm {} \;
