#!/bin/zsh
software_dir="${HOME}/software"
if [ ! -d ${software_dir} ]; then
  mkdir ${software_dir}
fi

target_name="oh-my-zsh"
date_time=$(date +"%Y%m%d")
compress_file_name=${software_dir}/${target_name}-${date_time}.tar.bz2

if [ ! -f ${compress_file_name} ]; then
  rm -frv ${software_dir}/${target_name}*.tar.*
  target_dir="${HOME}/.${target_name}"
  echo "tar -jcf $compress_file_name $target_dir"
  time tar -jcf $compress_file_name $target_dir
fi
