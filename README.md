# Research Techniques

This repository contains all the course material for Research Techniques: the course syllabus, assignments, exercises, examples, etc. It will be update throughout the semester.

## Generate the syllabus PDF

The directory `syllabus/` contains the LaTeX source code for the course syllabus. The PDF version is intentionally *not* published in order to encourage you to dive into using LaTeX. The procedure to generate the PDF yourself (from the command line):

1. `latexmk -pdf "syllabus-research-techniques"`
2. `biber "syllabus-research-techniques"`
3. `latexmk -pdf "syllabus-research-techniques"`

The command `latexmk` (that should be available when you have installed a LaTeX distribution on your computer), generates the PDF starting from the "main document" `syllabus-research-techniques.tex`. The PDF will not be finished in one go, the bibliography won't be included yet. The `biber` command will prepare for the generation of citations and the bibliography, the following call to `latexmk` will then actually produce the final PDF.

In TeXstudio:

1. First, check these settings:
    - Options > Configure TeXstudio > Build
    - Default Compiler: `latexmk`
    - Default Bibliography tool: `biber`
2. Compile (F6). TeXstudio will call the correct commands to generate the final version of the PDF.

## Additional Resources

- [De bachelorproef toegepaste informatica: een praktische Gids](https://github.com/bertvv/bachproef-gids) (only available in Dutch; work in progress, by Bert Van Vreckem)
- [Joint Committee on Standards for Graphic Presentation](http://www.jstor.org/stable/2965153?seq=1#page_scan_tab_contents)
- [Spurious correlations](http://dangerousminds.net/comments/spurious_correlations_between_nicolas_cage_movies_and_swimming_pool)
- [Simpson's paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox)
- [Twenty Statistical Errors Even YOU Can Find in Biomedical Research Articles](http://web.udl.es/Biomath/Bioestadistica/CMJ%2020%20stat%20errors.pdf)
- [Anscombe's Quartet](https://en.wikipedia.org/wiki/Anscombe%27s_quartet): four different data sets with identical statistical properties. Shows the importance of data visualization.
