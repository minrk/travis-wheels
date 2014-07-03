wget http://repo.continuum.io/miniconda/Miniconda-3.4.2-Linux-x86_64.sh -O miniconda.sh;

bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

conda install conda-build binstar --yes

# Crazily, conda needs jinja2...
conda install jinja2 setuptools --yes

git clone https://github.com/SciTools/conda-recipes-scitools.git

cd conda-recipes-scitools
# Replace the ssh protocol with https.
find -type f -exec sed -i 's/git\@github.com\:/https\:\/\/github\.com\//g' {} \;

for package in *; do
    if [ -d "${package}" ]; then
        echo "Building ${package}."
        conda build ${package}
    fi
done

# Only once we've built all the packages, upload them to binstar.
for package in *; do
    if [ -d "${package}" ]; then
        package_fname=$(conda build ${package} --output)
        echo "Filename: ${package_fname}"
        ls ${package_fname}
        binstar -t ${BINSTAR_TOKEN} upload ${package_fname}
    fi
done

