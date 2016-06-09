CashOut Grid Project

 ################################################################################################################################

 Building procedure:

 -	Maven is used
 -	There is a Maven profile for each environment within the root directory of the cashout-grid project (e.g. local, finbet-dev, dev, qa, �)
 -	When an environment profile is specified from the previous point then building procedure uses properties from file: {profileName}.properties to inject into other file that is packaged within the application and also used by the application
 -	The respective properties file contains the application parameters
 ################################################################################################################################


 Installation procedure:
-	(Prerequisite) The building procedure for this Coherence component is developed by complying with the layout of Coherence cluster as described here: http://confluence.gvcgroup.local/display/DevOps/Coherence+boxes+folders+layout
	There are two directories expected to be on place:
 		1. /opt/envs/${env-name}/${coherence-cluster-name}	(holding common files and configuration for Coherence cluster, e.g. /opt/envs/dev2/session-caching)
 		2. /opt/sb-apps/envs/&{env-name}/${app-name} (apps running within Coherence, e.g. /opt/sb-apps/envs/dev2/CashOutCoherence ) The building procedure makes package with directory layout that have to be placed under this directory. Upon building the project package will be on cashout-grid/target/cashout-grid-package/ path.
 		
-	There is no any custom preferences_grid.properties file for the Cashout Grid application.

-	The Coherence POF descriptor for Customer Preference grid is defined within cashout-data-pof-config.xml file.

-	The Coherence configuration file have to contain the following elements:
    <caching-scheme-mapping>
        <cache-mapping>
            <cache-name>${cashout.grid.build.environment}/cashout-data/CustomerCashOut</cache-name>
            <scheme-name>cashout-distributed-scheme</scheme-name>
        </cache-mapping>
    </caching-scheme-mapping>

    <caching-schemes>
		
		<!-- CashOut Cache Scheme -->
		<distributed-scheme>
			<scheme-name>cashout-distributed-scheme</scheme-name>
			<service-name>cashout-distributed-scheme</service-name>
			<backing-map-scheme>
				<local-scheme>
					<scheme-ref>limited-distributed-scheme</scheme-ref>					
				</local-scheme>
			</backing-map-scheme>
			<autostart>true</autostart>
		</distributed-scheme>		
		
		<!-- Default limited cache scheme -->
		<local-scheme>
			<scheme-name>limited-distributed-scheme</scheme-name>
			<eviction-policy>HYBRID</eviction-policy>
			<high-units>{back-size-limit 524288000}</high-units> <!--500MB -->
			<unit-calculator>BINARY</unit-calculator>
			<expiry-delay>{entry-expiry 0}</expiry-delay>			
		</local-scheme>
		
    </caching-schemes>

