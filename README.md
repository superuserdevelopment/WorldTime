# worldtime

A Flutter Application that shows an interactive interface to view time in various timezones around the world

## Features
<ol>
  <li> <b>Loading Screen:</b><br><ul><li>This Screen shows an loading animation until the main home page is loaded.</li></ul></li>
  <li> <b>Home Screen:</b><br>This Comprises of Three sections:
    <ol type='a'>
      <li><b>Primary Clock:</b>
          <ul>
              <li>This section contains the time for the primary clock.</li>
              <li>The time is in HH - MM - SS format.</li>
              <li>This is a Column widget which contains 3 main information related to the primary timezone.
                   <ul>
                       <li>Name of the timezone</li>
                       <li>An animated Digital Clock showing the current time in that timezone.</li>
                       <li>The UTC offset of the primary timezone.</li>
                   </ul>
               </li>
          </ul>
        </li>
       <li><b>First Timezone Carousel:</b>
           <ul>
               <li>This section contains a ListView of the first set of available timezones.</li>
               <li>Each timezone is a Card widget which contains 3 main information related to each timezone
                   <ul>
                       <li>Name of the timezone</li>
                       <li>An animated Analog Clock showing the current time in that timezone.</li>
                       <li>An animated Digital Clock showing the current time in that timezone.</li>
                   </ul>
                   <b>Tapping on a particular timezone pushes it to the primary clock display</b>
               </li>
               </ul>
        </li>
        <li><b>Second Timezone Carousel:</b>
           <ul>
               <li>This section contains a ListView of the first set of available timezones.</li>
               <li>Each timezone is a Card widget which contains 3 main information related to each timezone
                   <ul>
                       <li>Name of the timezone</li>
                       <li>An animated Analog Clock showing the current time in that timezone.</li>
                       <li>An animated Digital Clock showing the current time in that timezone.</li>
                   </ul>
                   <b>Tapping on a particular timezone pushes it to the primary clock display</b>
               </li>
               </ul>
        </li>
      </ol>
  </ol>
