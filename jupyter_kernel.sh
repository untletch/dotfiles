# install go kernel
echo "Installing go to jupyter lab..."
env GO111MODULE=off go get -d -u github.com/gopherdata/gophernotes
cd "$(go env GOPATH)"/src/github.com/gopherdata/gophernotes
env GO111MODULE=on go install
mkdir -p ~/.local/share/jupyter/kernels/gophernotes
cp kernel/* ~/.local/share/jupyter/kernels/gophernotes
cd ~/.local/share/jupyter/kernels/gophernotes
chmod +w ./kernel.json # in case copied kernel.json has no write permission
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json
echo 'Run "$(go env GOPATH)"/bin/gophernotes'
echo "Output: 2017/09/20 10:33:12 Need a command line argument specifying the connection file."

# install javascript kernel
echo "Installing javascript kernel..."
npm config set prefix $HOME
npm install -g ijavascript
ijsinstall

# install c++ kernel
echo "Installing c++ kernel..."
conda create -n cling
conda activate cling
conda install xeus-cling -c conda-forge
