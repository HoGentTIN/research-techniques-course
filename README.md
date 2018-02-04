# Research Techniques

This repository contains all the course material for Research Techniques. Most of the content is pretty recently translated into English. It will most probably contain several spelling errors and grammatical mistakes. Feel free to suggest any improvements or even better; update your clone and create a *pull request*. If you offer a substantial contribution, I'll mention you in the aknowledgments.

## Software Installation

For the course Research Techniques you will need a few software packages. Here you can find some information about the installation and the usage. If you have any issues: ask help during the exercise sessions or via [the forum on Chamillo](https://chamilo.hogent.be/index.php?go=CourseViewer&application=Chamilo%5CApplication%5CWeblcms&course=27226&tool=Forum&browser=List&tool_action=Browser).

### Windows

First install the Chocolatey package manager (<https://chocolatey.org/>) in a "Windows PowerShell (**Admin**)" terminal (or in a CMD terminal).
Next type the commands below, again in a "Windows PowerShell (**Admin**)" terminal (or in a CMD terminal).

```
choco install git
choco install miktex
choco install texstudio
choco install JabRef
choco install r.project
choco install r.studio
```

Alternatively you can install the software in a *traditional* way, by downloading the packages from the web sites concerned:

- Git: <https://git-scm.com/download/win>
- MikTeX: <https://miktex.org/download>
- TeXStudio: <http://www.texstudio.org/>
- JabRef: <https://www.fosshub.com/JabRef.html>
- R: <https://lib.ugent.be/CRAN/>
- Rstudio: <https://www.rstudio.com/products/rstudio/download/#download>

### MacOS X

Install the software in the *traditional* way:

- Git: <https://git-scm.com/download/mac>
- MacTeX: <https://www.tug.org/mactex/mactex-download.html>
- TeXStudio: <http://www.texstudio.org/>
- JabRef: <https://www.fosshub.com/JabRef.html>
- R: <https://lib.ugent.be/CRAN/>
- Rstudio: <https://www.rstudio.com/products/rstudio/download/#download>

Or use the homebrew package manager (<https://brew.sh/>).  
***Warning:*** *this is not yet tested, feedback is welcome!*

```
brew install git
brew cask install mactex
brew cask install texstudio
brew cask install jabref
brew tap homebrew/science
brew install Caskroom/cask/xquartz
brew install --with-x11 r
brew cask install --appdir=/Applications rstudio
```

### Linux:

**Ubuntu/Debian.** First check the link to the latest version of RStudio via <https://www.rstudio.com/products/rstudio/download/#download>. You might want or need to replace "rstudio-1.1.419-amd64" in the commands below by something else:

```
sudo aptitude update
sudo aptitude install git texlive-latex-base texstudio jabref r-base
wget https://download1.rstudio.org/rstudio-1.1.419-amd64.deb
sudo dpkg -i ./rstudio-1.1.419-amd64.deb
```

**Fedora.** First check the link to the latest version of RStudio via <https://www.rstudio.com/products/rstudio/download/#download>. You might want or need to replace "rstudio-1.1.419-x86_64.rpm" in the commands below by something else:

```
sudo dnf install git texstudio texlive-collection-latex texlive-babel-dutch jabref
sudo dnf install R https://download1.rstudio.org/rstudio-1.1.419-x86_64.rpm
```

## Configuration

### Git, Github

Probably you have configured Git already before for some other courses.

**It is preferable to use Git via the command line.** This way you will get the best understanding about how git works. `git status` gives a good overview of the status of your local repository and it will give you hint about the next step to take.

First a few tips:

- If you don't have an account on github.com yet, choose a **user name** that you can use after your studies. Chances are big you will use GitHub later on, during your career.
- Add your **HoGent email** as (one of) your email address(es) to your GitHub account. This way you will get free access to the [GitHub student developer pack](https://education.github.com/pack); a pack with some products and services you might be interested in.

For all the commands below, use **Git Bash** on Windows or any kind of command terminal on Linux or MacOS X.

```
git config --global user.name "Pieter Stevens"
git config --global user.email pieter.stevens.u12345@student.hogent.be
git config --global push.default simple
```

Create an [SSH key](https://help.github.com/articles/connecting-to-github-with-ssh/) to simplify the synchronization with GitHub. Otherwise you will need to type your password for every *push* or *pull*.

```
ssh-keygen
```

Follow the instructions on your command line terminal. If you are asked for a *pass phrase*, just press ENTER. In the users home directory (eg. `c:\Users\Bert` on Windows, `/Users/bert` on Mac, `/home/bert` on Linux) you'll now find a directory `.ssh/` with the files: `id_rsa` (your private key) and `id_rsa.pub` (your public key). Copy the entire content of `id_rsa.pub` (obtained by `cat id_rsa.pub`) to your clipboard. Go to your [GitHub Settings](https://github.com/settings/profile) and choose [SSH and GPG keys](https://github.com/settings/keys) at the left side. Click on the green button "New SSH Key" at the upper right corner and paste your public key in the "Key" field and confirm.

Now you can test if you can *clone* the content of this repository to your local computer. In *Git Bash* (Windows) or just plain *Bash* (Linux/Mac), go to the directory where you (are planning to) have all your Git projects and type:

```
git clone git@github.com:HoGentTIN/research-techniques-course.git
```

This should create a subdirectory `research-techniques-course/`. Make sure to do a `git pull` in this directory on a regular basis to get the latest changes.

### Configuring TeXStudio

Check the following settings via *Options > Configure TeXstudio*

- Build
    - Default Compiler: `pdflatex`
    - Default Bibliography tool: `biber`
- Editor:
    - Indentation mode: *Indent and Unindent Automatically*
    - Replace Indentation Tab by Spaces: *Enable check mark*
    - Replace Tab in Text by spaces: *Enable check mark*
    - Replace Double Quotes: *English Quotes: ``''*

To test TeXStudio, open `syllabus/research-techniques.tex` and choose *Tools > Build & View* to compile the syllabus into a PDF file. This can take some time, without any animation on the screen... So, be patient.

If this is the first time you compile a TeX file, it might be necessary to install some additional packages. MiKTeX will show a popup to ask for your permission to install these packages automatically. 

If there are any errors during compilation, you will get the error messages in the *Log* tab. Always mention the **exact error message** when asking for help. The easiest is to go to the *Log File* tab (after selecting the *Log* tab) and copy the entire content.

### JabRef

[JabRef](http://www.jabref.org/) is a GUI to edit BibTeX files; a kind of data base of scientific articles (papers) and professional/technical specialist literature for LaTeX documents.

After starting JabRef and opening a Bib file (eg. syllabus/biblio.bib) double check if you are in the **BibLaTeX** mode, and **not** in the **BibTeX** mode. This is necessary to be compatible with the data base of the syllabus and the LaTeX Template for the Bachlor's thesis.

- Choose *File > Switch to BibLaTeX mode* if necessary.
- Under *Preferences* choose for *File* and specify a directory name under *Main file directory* where you will keep all PDFs from scientific papers and articles. It is recommended to download all sources into that directory. If you rename these files using the *BibTeX key*, you will be able to easily open the articles from within Jabref. (*BibTeX keys* typically consist of the first author and the year of publication; eg. Knuth1998.pdf.)

### LaTeX on the command line (legacy)

The procedure to generate the PDF from the command line:

1. `cd syllabus`
2. `latexmk -pdf "research-techniques"`
3. `biber "research-techniques"`
4. `latexmk -pdf "research-techniques"`

The command `latexmk` (that should be available when you have installed a LaTeX distribution on your computer), generates the PDF starting from the "main document" `research-techniques.tex`. The PDF will not be finished in one go, the bibliography won't be included yet. The `biber` command will prepare for the generation of citations and the bibliography, the following call to `latexmk` will then actually produce the final PDF.

## Additional Resources

- [R Tutorial](https://www.tutorialspoint.com/r/)
- [De bachelorproef toegepaste informatica: een praktische Gids](https://github.com/bertvv/bachproef-gids) (only available in Dutch; work in progress, by Bert Van Vreckem)
- [Joint Committee on Standards for Graphic Presentation](http://www.jstor.org/stable/2965153?seq=1#page_scan_tab_contents)
- [Spurious correlations](http://dangerousminds.net/comments/spurious_correlations_between_nicolas_cage_movies_and_swimming_pool)
- [Simpson's paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox)
- [Twenty Statistical Errors Even YOU Can Find in Biomedical Research Articles](http://web.udl.es/Biomath/Bioestadistica/CMJ%2020%20stat%20errors.pdf)
- [Anscombe's Quartet](https://en.wikipedia.org/wiki/Anscombe%27s_quartet): four different data sets with identical statistical properties. Shows the importance of data visualization.

## Acknowlegdments

This document is based on a [similar document in Dutch](https://github.com/HoGentTIN/onderzoekstechnieken-cursus/blob/master/README.md) mainly written by Bert Van Vreckem.