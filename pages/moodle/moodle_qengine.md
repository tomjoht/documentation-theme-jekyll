---
title: Qengine
keywords: moodle, qengine, question_type
sidebar: moodle_sidebar
permalink: moodle_qengine.html
folder: moodle
---

## Introduction

Qengine is a question type plugin for Moodle that was developed by Eric Fossas who graduated from CU CS in 2017 and has been working for us since May 2017.  He has done an outstanding job developing this and I encourage everyone that has a use case to start using this software.

Qengine leverages powerful and extendable back-ends such as SageMath and Python and can produce questions from basic algebra, calculus, discrete math (graphs, trees), number theory, graph theory, etc. The architecture can be extended to support other programming languages and math packages as well.

Qengine works by producing a different version of the same question by randomizing question variables. When a student attempts a question, they will be presented with a different variation of the same question.  It uses a random seed to build a question, so for every unique attempt, a new random seed is generated.  The random seed is stored so the same question will be generated for every unique submission. This means when regrading and reviewing student submissions you will see the same question they were presented with.

Previously, this was somewhat accomplished by writing numerous versions of the same question and changing the variables which amounted to lots of work by TAs and cumbersome question/quiz management. This helps streamline that entire process by authoring single questions that randomize and provides uniqueness for every student.

## Links

CU CS Deployment- [https://bengine.csel.io/](https://bengine.csel.io/)

Homepage- [https://github.com/academicsystems/Qengine](https://github.com/academicsystems/Qengine)

## Demo Video

[![qengine demo video](https://img.youtube.com/vi/LGr50kKmO4A/0.jpg)](https://www.youtube.com/watch?v=LGr50kKmO4A)

## Video Tutorial

{% include note.html content="We have a bengine already running so you do not need to setup your own locally hosted version." %}

[![qengine tutorial video](https://img.youtube.com/vi/r7I3IAR2MtA/0.jpg)](https://www.youtube.com/watch?v=r7I3IAR2MtA)

## Question Bank

Here is the repository with all developed Qengine questions. If you do not have access please submit request to help@cs.colorado.edu

[https://bitbucket.org/cubouldercsci/qengine/src/master/](https://bitbucket.org/cubouldercsci/qengine/src/master/)

## Moodle Demos

[Qengine demo quiz](https://moodle.cs.colorado.edu/mod/quiz/view.php?id=22321)

[Qengine demo quiz (editable)](https://moodle.cs.colorado.edu/mod/quiz/view.php?id=30602)
