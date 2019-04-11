---
title: Combined Cloud Project
keywords: combined, cloud, openstack, vm, baremetal
sidebar: helpatcs_sidebar
toc: false
permalink: helpatcs_combined_cloud.html
folder: helpatcs
---

## Executive Summary

In the last decade we have seen explosive growth in the field of computer science education. The number of students seeking a computer science degree has continued to grow in both the undergraduate and graduate tracks. In order to adapt to the changes in business, many non-computer science students are also enrolling in computer science classes. As a result, the computer science program has hired new instructors and professors to meet the growth in demand.

In addition to the influx of students demanding computer science skills, the tools to support larger classes and modern systems are quickly outpacing our existing digital infrastructure. A stable foundation for educators to deploy educational resources that allows all students to focus on the materials being presented is not available today due to the overwhelming cost of unmanaged cloud services. Instructors have been burdened with locating and training on outside services or adapting curriculum to fit within these limitations. Ultimately, students are mandated to use a hodgepodge of tools and services to complete their coursework that takes away from the core learning.

To compensate for these shortcomings, staff and educators have worked together to identify best of breed tools, services, and procedures to reduce the strain, and while this has helped, it too comes at a significant cost. In the interest of creating a controlled environment, a VM images is provided to students with the core tools needed by the school. However, this VM is still running on a student’s personal computer and the burden of support still falls to the school. Online services offer a very attractive alternative because they rely very little on the individual’s personal computer and deliver very elaborate tooling with minimal requirements. However, free online services suffer from high turnover (failure, buyout, etc), and limited usage (time, size, etc) while the price of a subscription service is an uncontrolled expense that puts us at risk of service loss.

In order to remove these burdens, we must provide infrastructure to support the ever changing needs of the school. Cloud providers offer a compelling proposition, but quickly become costly when not properly managed (e.g. shutdown when unused). However, leveraging the University’s resources to deploy a cloud offers us the opportunity to support diverse workloads and provide the services needed by the school to keep students focused on learning and educators on supporting the students, school, and the future.



## Introduction

The Computing Infrastructure Subcommittee was formed to identify strategic direction and deploy common-good services, network, compute, storage, and training that supplement the Office of Information Technology (OIT) for the current and future needs of the students, staff and faculty in computer science education, research, and administration.



## Problem Description and Background

As computer science has evolved into an interconnect network of systems and services, the infrastructure needed to support classes has grown increasingly complex. Until recently, many systems were scaled vertically by purchasing servers with more processing power, memory, and disk storage. Because of this, smaller models could be used to teach the same fundamental skills on a smaller scale. However, the systems continued to grow more quickly than technology could reduce the expense of more powerful hardware, and industry was forced to adapt by supporting a horizontal scaling that permitted growth through the addition of cheaper commodity hardware. This change mandated that software adapt to function in a distributed manner, and interact with various network connected services. In response, educators have modernized classes to include the distributed nature of modern systems. However, this distribution has been slowed by a lack of compute resources to host student learning.

In computer science education, it is not unreasonable to expect students to have a personal computer, but when class activities are hosted on student’s computers, any problem with baseline software slows class progress and increases the demand on educators and support personal. This leaves the school in the position of supporting a variety of hardware, operating systems, and software dependencies. In response to these challenges, the school has deployed a virtual machine (VM) image that provides a baseline systems for use in classes. While this has significantly reduced the need to support student computers, there is still a regular need for support of the hypervisor, failed VMs, and lost files. Still, the problem worsens when the networked aspect of distributed systems is brought forward.

The nature of interconnected network can be simulated on a VM, but scaling is dependent on the transient uncontrolled student hardware. Various faculty have distributed pre-built VM and rolled out container environments to simulate a multi node deployment, and have encountered personal computer resource limitations that punishes those with less powerful hardware and diverges from the intended learning paths. In addition, because these resources are deployed in an untrusted environments, the integrity and confidentiality of the resources cannot be ensure which leads to additional overhead in the assessment process when educators must move assignments into a trusted environment to determine an official grade. Still worse, the true interconnectedness needed to simulate a real-world system is limited to a single student and removes the possibility of a true always-on network where students’ projects can interact as needed.     

## Objectives / Goals

On-demand compute resources
Educator controlled VM images and network connectivity
Education focused management automation

## Scope

An overview of the scope of work is covered below. Each of the items contain a large amount of work that are prone to delays. Please see the Risks of undertaking project section of a non-comprehensive list of potential delays.

1. Acquire hardware
2. Data center: Identification, preparation, and installation
3. OpenStack: installation, UCB integration, and testing
4. Board new use cases
5. ITP Stack: Migration, testing, and hardware merge
6. Education Stack: Migration, testing, and hardware merge
7. Research Stack: Migration, testing, and hardware merge
8. Other Stack(s): Migration, testing, and hardware merge


## Requirements
Steps 1 - 3 above rely heavily on the Office of Information Technology (OIT) to provide the initial hardware installation and network connectivity. While these steps are business-as-usual (BAU) activities for OIT, it is a major process that will take a significant amount of time.  Staff in the Department of Computer Science will be responsible for the remaining steps. Step 4 will require people looking for resources for their classes or projects to work with staff to deploy needed resources, and is an open ended process with no end date. Steps 5 - 6 are dependent on the current stack owners and the timeframe will be determined by those owners.

## Timeline

| Description of Work | Start and End Dates |
| Phase One: Hardware Installation | TBD |
| Phase Two: OpenStack Build | TBD |
| Phase Three: Deploy | TBD |




## Project Budget

| Description of Work | Budget |
| Phase One: Hardware Installation | TBD |
| Phase Two: OpenStack Build |  TBD |
| Phase Three: Deploy | TBD |
|  | Total $  0.00 |




## Key Stakeholders / Personnel

Client: Department of Computer Science

Sponsor: Evan Chang

Project Manager: Sangtae Ha

Team: Timothy Coleman, Brett Shouse




## Monitoring and Evaluation

The project manager will monitor our progress and ensure that the proper steps are being taken to reach completion in our allocated time frame. Our team will meet at our regularly scheduled Infrastructure Committee meeting, present our progress report, and evaluate the progress made. Any forecasted or actual problems with be communicated to with all stakeholders so that any necessary mitigations can be put into place.


## Risks of undertaking project

The technical aspects of this project are minor and unlikely to encounter failure. However, there are many prerequisites and dependencies that could extend the delivery of the functional Combined Cloud.



## Success Criteria

* Combined Cloud hardware installed and operating
* OpenStack available for use
* Other clouds migrated




## Endorsements / Authorizations
* Evan Chang, Associate Professor
* Sangtae Ha, Assistant Professor
* Timothy Coleman, Staff
* Brett Shouse, Staff


## Next Steps

To formalize this proposal an approval from the Department of Computer Science must be received by the Computing Infrastructure committee.
