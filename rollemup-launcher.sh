# Save variable files in user home directory.
data_dir=${XDG_DATA_HOME:-$HOME/.local/share}/rollemup
mkdir -p $data_dir/Games
touch $data_dir/Rollemup.ini

# CWD must be in the directory containing game resources to make it working.
# Also, CWD must be writeable for highscores and configuration.
mkdir /tmp/rollemup-runtime
cd /tmp/rollemup-runtime

ln -s /app/extra/Rollemup .
ln -s /app/extra/Media .
ln -s $data_dir/Games .
ln -s $data_dir/Rollemup.ini .

# Needed for "fake-netscape.sh" script.
mkdir Upload

# Compatibility with PulseAudio.
export LD_PRELOAD="$LD_PRELOAD /app/lib/i386-linux-gnu/pulseaudio/libpulsedsp.so"
export PADSP_CLIENT_NAME="Roll 'm Up"

exec ./Rollemup
