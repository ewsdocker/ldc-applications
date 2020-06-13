
__Preliminary Documentation__ - 2020-06-13
____  
__ldc-applications: The LDC (Linux Docker Containers) Applications project.__  

____  

<table>
 <thead>
  <tr><th>NOTE</th></tr>
 </thead>
 <tbody>
  <tr><td>The <b>ewsdocker/ldc-applications</b> documentation has moved to the <a href="https://ewsdocker.github.io/ldc-applications/">LDC Framework Web Page</a>.
    <br>
    <br />
    The documentation on this page is being maintained only when <i>version</i> changes to
    the project are published. </td>
  </tr>
 </tbody>
</table>  

____  
<b>Contents</b>
<ul>
 <a href="#Overview">Overview</a>
 <br />
 <a href="#relinfo">Release Information</a>
 <br />
 <ul>
  <a href="#rellink">Release Links</a>
  <br />
  <a href="#relnote">Release Notes</a>  
 </ul>
</ul>
<hr />
<a name="Overview"><b>Overview</b></a>  

The primary goal of the <b>LDC Applications</b> project is to 
streamline <i>Docker</i> container application development by providing:

<ul>
  <li>
    a container structure and coherent library utilities provided by
    the <b>LDC Framework</b>;
  </li>
  <li>
  </li>
</ul>

</div>
<hr />  


<a name="relinfo"><b><u>Release Information</u></b></a>  
<ul>
 <b>ldc-applications</b> is in pre-release as version <i>0.1.0</i> during transition from independent projects to a more coherent, single project to support  fast creation of <b>Docker</b>-based container applications.
<br />

<br />
The home page of the <a href="https://github.com/ewsdocker/ldc-applications">ldc-applications</a> is the current development, which can be considered to be neither safe to use nor fully operational.
<br />

<br />
The newest release version is the <i>current release</i> of the source, and forms the basis for the <i>latest release</i> images in the <b>Docker</b> repository.  
<br />

<br />
All release versions are available in both <i>Zip</i> and <i>Tar-Gzip</i> archival format, available through the <i>release</i> selection on the GIT menu.  
</ul>

<a name="rellink"><b><u>Release Version Links</u></b></a>
<ul>
<table border=0>
 <tr>
  <th>&nbsp;Release&nbsp;</th>
  <th>&nbsp;Status&nbsp;</th>
  <th>&nbsp;Date&nbsp;</th>
  <th>&nbsp;Zip Source&nbsp;</th>
  <th>&nbsp;Tar Source&nbsp;</th>
 </tr>
 <tr>
  <td>&nbsp;0.1.0-b3&nbsp;</td>
  <td>&nbsp;Development&nbsp;</td>
  <td>&nbsp;2020-06-13&nbsp;</td>
  <td>&nbsp;&nbsp;</td>
  <td>&nbsp;&nbsp;</td>
 </tr>
 <tr>
  <td>&nbsp;0.1.0-b2&nbsp;</td>
  <td>&nbsp;Released&nbsp;</td>
  <td>&nbsp;2020-06-12&nbsp;</td>
  <td>&nbsp;<a href="https://github.com/ewsdocker/ldc-applications/archive/ldc-applications-0.1.0-b2.zip">0.1.0-b2.zip</a>&nbsp;</td>
  <td>&nbsp;<a href="https://github.com/ewsdocker/ldc-applications/archive/ldc-applications-0.1.0-b2.tar.gz">0.1.0-b2-tar-gz</a>&nbsp;</td>
 </tr>
 <tr>
  <td>&nbsp;0.1.0-b1&nbsp;</td>
  <td>&nbsp;Released&nbsp;</td>
  <td>&nbsp;2020-05-30&nbsp;</td>
  <td>&nbsp;<a href="https://github.com/ewsdocker/ldc-applications/archive/ldc-applications-0.1.0-b1.zip">0.1.0-b1.zip</a>&nbsp;</td>
  <td>&nbsp;<a href="https://github.com/ewsdocker/ldc-applications/archive/ldc-applications-0.1.0-b1.tar.gz">0.1.0-b1-tar-gz</a>&nbsp;</td>
 </tr>
</table>
</ul>

<a name="relnote"><b><u>Release Notes</u></b></a>
<ul>
 <dl>
  <dt>0.1.0-b3</dt>
   <dd>
    <li></li>
   </dd>

  <br />

  <dt>0.1.0-b2</dt>
   <dd>
    <li>
     Upgraded to LDC Framework version <i>0.1.0-b2</i> and <i>Debian 10.4</i>; 
    </li>
    <li>
     Upgraded all application projects to work with <i>Debian 10</i>;
    </li>
    <li>
     Upgraded all applications to current stable release, where available;
    </li>
    <li>
     Upgraded ldc-browser:netsurf to version 3.10 using unstable release;
    </li>
    <li>ldc-browser:firefox reverts to unstable release when a new release is
        available but not in the Debian stable repository,
    </li>
    <li>
     ldc-browser:ffquantum remains the current Debian stable repository;
    </li>
    <li>
     introduced ldc-browser:firefox-esr based upon latest Debian stable repository;
   </dd>

  <br />

  <dt>0.1.0-b1</dt>
   <dd>
    <li>Transition all projects to the applications project;</li>
    <li>Re-write of all applications projects to use ldc-framework paradigms;</li>
    <li>Uniform approach to all builds and run configuration;</li>
    <li>Upgraded all applications to Debian 9.12;</li>
    <li>ldc-browser:netsurf version 3.8 is broken;</li>
    <li>
     ldc-eclipse:javascript is broken until <i>NodeJS</i> problems are repaired;
    </li>
   </dd>
 </dl>
</ul>
<hr />
<b>Copyright © 2017-2020. EarthWalk Software.</b>
<br />
<br />
