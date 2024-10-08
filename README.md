# Quickwin - Getting started on Earth Observation Application Packaging with CWL

This repository supports "**Getting started on Earth Observation Application Packaging with CWL**" tutorial events, where participants are introduced to the world of Eearth Observation (EO) Application Packages and explore how to effectively package, share, and execute EO workflows using the Common Workflow Language (CWL) standard.

This tutorial event is designed for developers, scientists, and EO enthusiasts who want to get started and increase their skills in creating and sharing EO Application Packages. Whether you are new to CWL or already have some experience, this event will provide valuable insights and practical knowledge to boost your expertise.

With this tutorial, developers will learn:

* The fundamentals of EO Application Packages and their role in the EO domain.
* How to leverage CWL to describe, package, and share workflows.
* Techniques for incorporating data, code, configuration files, and documentation into an EO Application Package.
* Best practices for creating portable and reproducible EO workflows.
* Hands-on exercises to reinforce your understanding and gain practical experience.

When developers package an EO Application, they are in fact packaging their own software, written in a specific programming language, as a containerized application (or a set of containerized applications), to be described as an EO Application Package using the CWL as described in the OGC proposed best practices.

This tutorial will guide developers through step-by-step examples, demonstrating the process of creating EO Application Packages using CWL with a simple EO application for water bodies detection using the Normalised Difference Water Index (NDWI). 

## Implementation

To facilitate this process, developers are guided through the tutorial using interactive Jupyter Notebooks to test the Application Package across various execution scenarios:

1) **Application**: it describes a simple EO application for water bodies detection using the Normalised Difference Water Index (NDWI). The application is written in Python and invoked with `CliRunner` from within the Notebook.
2) **Container**: it creates the container image containing the execution dependencies of the application developed in the previous Notebook, and it executes it in `bash` using `podman`.
3) **CWL-CommandLineTool**: it prepares the CWL *CommandLineTool* document(s) wrapping the command line tool available in container(s).
4) **CWL-Workflow**: it prepares the CWL *Workflow* that orchestrates the *CommandLineTool* document(s) wrapping the command line tool available container(s).

The webpage of the documentation is https://eoap.github.io/quickwin. 

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)