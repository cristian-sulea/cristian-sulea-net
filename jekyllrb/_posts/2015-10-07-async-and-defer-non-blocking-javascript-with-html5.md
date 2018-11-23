---

layout: post

title:       "Async and Defer (non-blocking JavaScript with HTML5)"
description: "A script tag causes the browser to halt rendering, load a file, and run the code (the script will be executed before parsing is resumed)."

categories: [async, defer, javascript]

resources:
  - "[async vs defer attributes](http://www.growingwiththeweb.com/2014/02/async-vs-defer-attributes.html)"
  - "[Asynchronous and deferred JavaScript execution explained](http://peter.sh/experiments/asynchronous-and-deferred-javascript-execution-explained/)"
  - "[Load Non-blocking JavaScript with HTML5 Async and Defer](http://www.sitepoint.com/non-blocking-async-defer/)"

---


Loading JavaScript is one of the biggest performance bottlenecks.
A script tag causes the browser to halt rendering, load a file, and run the code (the script will be executed before parsing is resumed).
For slow servers and heavy scripts this means that displaying the webpage will be delayed.

<table role="presentation">
	<colgroup>
		<col style="width: 35%" />
		<col style="width: 20%" />
		<col style="width: 10%" />
		<col style="width: 35%" />
	</colgroup>
	<tbody >
		<tr>
			<td style="background-color: lime;">&nbsp;</td>
			<td style="background-color: gray;" colspan="2">&nbsp;</td>
			<td style="background-color: lime;">&nbsp;</td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: blue;">&nbsp;</td>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
			<td style="background-color: red;">&nbsp;</td>
			<td style="background-color: white;"></td>
		</tr>
	</tbody>
</table>

Legend:

<table role="presentation">
	<tbody>
		<tr>
			<td style="background-color: lime; min-width: 1.5em;"></td>
			<td style="min-width: 1em;"></td>
			<td style="width: 99%;">HTML Parsing</td>
		</tr>
		<tr>
			<td style="background-color: gray;"></td>
			<td></td>
			<td>HTML parsing paused</td>
		</tr>
		<tr>
			<td style="background-color: blue;"></td>
			<td></td>
			<td>Script download</td>
		</tr>
		<tr>
			<td style="background-color: red;"></td>
			<td></td>
			<td>Script execution</td>
		</tr>
	</tbody>
</table>


## &lt;script defer&gt;

**(deferred execution)**

The browser will begin to download the deferred scripts in parallel without stopping page processing (during HTML parsing) and will only execute them after the parser has completed. A positive effect of this attribute is that the DOM will be available for the scripts.

The scripts downloaded with `defer` are also guaranteed to execute in the order that they appear in the document.

<table role="presentation">
	<colgroup>
		<col style="width: 35%" />
		<col style="width: 20%" />
		<col style="width: 35%" />
		<col style="width: 10%" />
	</colgroup>
	<tbody>
		<tr>
			<td style="background-color: lime;" colspan="3">&nbsp;</td>
			<td style="background-color: white;"></td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: blue;">&nbsp;</td>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
			<td style="background-color: red;">&nbsp;</td>
		</tr>
	</tbody>
</table>


## &lt;script async&gt;

**(asynchronous execution)**

The `async` is identical to `defer`, except that the script executes at the first opportunity after download (will pause the HTML parser to execute it when it has finished downloading).

<table role="presentation">
	<colgroup>
		<col style="width: 35%" />
		<col style="width: 20%" />
		<col style="width: 10%" />
		<col style="width: 35%" />
	</colgroup>
	<tbody>
		<tr>
			<td style="background-color: lime;" colspan="2">&nbsp;</td>
			<td style="background-color: gray;">&nbsp;</td>
			<td style="background-color: lime;">&nbsp;</td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: blue;">&nbsp;</td>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
		</tr>
		<tr>
			<td style="background-color: white;"></td>
			<td style="background-color: white;"></td>
			<td style="background-color: red;">&nbsp;</td>
			<td style="background-color: white;"></td>
		</tr>
	</tbody>
</table>


## When should I use what?

Typically you want to use `async` where possible, then `defer` then no attribute.

Some general rules to follow:
- if the script is modular and does not rely on any scripts then use `async`;
- if the script relies upon or is relied upon by another script then use `defer`;
- if the script is small and is relied upon by an `async` script then use an inline script with no attributes placed above the `async` scripts.
