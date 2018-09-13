---

layout: post

title:       "Software Development Roles"
description: "Each of the software development processes may change to some extent, but fundamentally there are some roles which every process has in one form or another."

categories: software development roles

resources:
  - "a PDF file named \"Developer eBook\" and downloaded from [Internet.com](http://www.internet.com) (deleted in the meantime)"
  - "it seems that the source for that \"Developer eBook\" is an older article from [Developer.com](http://www.developer.com/mgmt/article.php/3490871/Cracking-the-Code-Breaking-Down-the-Software-Development-Roles.htm) web site, and the author is [Robert Bogue](mailto:Robert.Bogue@CroweChizek.com)"

---


Software development is done differently at every organization, and in every home office throughout the world.
The process that one organization or person uses to develop software may work for their specific environment and situation,
but may fail miserably in another set of circumstances.

However, despite these changes there are some things that remain the same. There will always be a need to understand the business problem,
convert that problem into an architecture, convert the architecture into a solution, test the solution, and deploy the solution.
Although each of these processes may change to some extent based on the programming models and tools being used, fundamentally there are some roles
which every process has in one form or another.
One person may be filling all the roles or a handful of the roles, or one very specific role.
Despite this there is a need for all of the roles - each serves a purpose.
The organization chart below gives you an idea of how each position fits together within an organization.


## Common Roles

There is a series of roles that exist in most software development processes.
As mentioned above one team member may be filling many roles and some roles may be suppressed for a specific type of project
but all of these roles exist in one form or another in every software development project:

[![software development roles]({{site.images}}{{page.url}}software-development-roles.png)]({{site.images}}{{page.url}}software-development-roles.png)

### Subject Matter Experts (SMEs)

The subject matter expert is the person or persons from which requirements are captured.
These are the people who know what the software needs to do and how the process works.
The SME role is somewhat different from the other roles because it is constantly changing as
new clients (internal or external) are brought in to help design a solution.
SMEs are rarely from IT - except when the solution is being designed to support IT.
SMEs are most frequently the person who will receive the benefit of the system.


### Functional Analysts (FAs)

Functional analysts have the unenviable roles of eliciting clear, concise, non-conflicting requirements from the Subject Matter Experts
who may or may not understand how technology can be used to transform the business processes in a positive way.


### Solutions Architect (SA)

The technical architect is responsible for transforming the requirements created by the Functional Analysts
into a set of architecture and design documents that can be used by the rest of the team to actually create the solution.
The Solutions Architect is typically responsible for matching technologies to the problem being solved.


### Development Lead (DL)

The development lead's role is focused around providing more detail to the Solution Architect's architecture.
This would include detailed program specifications creation.
The Development Lead is also the first line of support for the developers who need help understanding a concept or working through a particularly thorny issue.


### Developer (Dev)

The heart and soul of the process, the developer actually writes the code that the Development Leads provided specifications for.


### Quality Assurance (QA)

The quality assurance role is an often thankless position that is designed to find bugs before they find their way to the end customers.
Using a variety of techniques ranging from keying in data and playing with the system to formalized to automated testing scripts,
the Quality Assurance team is responsible for ensuring the quality of the solution and it's fit to the requirements gathered by the Functional Analyst.
Sometimes the QA team is known by their less flattering name of testers.


### Deployment (Deploy)

The deployment role is the one which packages up all of the compiled code and configuration files and deploys it through the appropriate environments or on the appropriate systems.
The deployment role is focused on getting the solution used.
To that end the role may include automated software installation procedures or may be as simple as copying the files to the appropriate place and running them.


### Training

The training role is responsible for documentation for the system as well as any instructor or computer based training solutions,
which are designed to help the users better understand how the system works and what they can do with it.


### Project Manager (PM)

The project manager is responsible for ensuring consistent reporting, risk mitigation, timeline, and cost control.
The project manager role is a problem solver role.
They try to resolve problems why they are small so that they can be handled more quickly and with less cost.


### Development Manager (DM)

The development manager is responsible for managing multiple priorities of conflicting projects.
The Development Manager role is also an escalation for issues from the team, which it is unable to resolve internally.


## Critical Skills for Every Role

A set of skills was identified to be essential business skills that professionals in nearly every role needed to consider during their career.


### Understanding Business

Although some roles are focused very specifically around certain aspects of understanding and converting business requirements,
every role in the process should have an awareness and sensitivity to the business processes and needs which require technology in the first place.
Without this technology may be implemented but it may not solve the real needs and will therefore be considered a failure.


### Broad Understanding

Although an understanding of software development is critical there are other areas where an understanding can be invaluable.
For instance, understanding how computers work internally including memory, cache, hard drives, etc.,
can help you learn how to more appropriately conserve those resources.
Similarly understanding networking can help in the development of applications,
which are compatible or even friendly to the networks that they're working across.
SMEs broad understanding of the industry can be invaluable in terms of creating solutions that fit both the organization and the industry.
The QA team can benefit the project by a broad understanding by minimizing QA costs while improving testing coverage.
In short, a broad understanding can help every role.


### Multiple Perspectives

The ability to approach solutions from multiple perspectives is critical to software development.
Understanding how each person who is working on a problem views an issue - or how different customers will view the solution
is important to be able to find the best solution based on all of the information.
There are always multiple ways of viewing - and solving - a problem.
The trick is to find the best one from the list of possible options.
The larger the list of options (perspectives) the better the solution.


### People Skills

Also known as soft skills, the ability to interact with other people and to be a part of a team is essential to nearly every role in a software development project.
The lower the overall people skills of the team the higher the likelihood that the project will end in some explosion.


{% include resources.html %}
