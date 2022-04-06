data class Peak (var name: String, val latitude: Double, val longitude: Double)

fun listPeaks() : 
List<Peak> {return listOf(
		Peak( "Gallatin Peak",45.3683,-111.3658),
        Peak("Granite Peak",45.1633,-109.8080),
        Peak("Whitetail Peak",45.0888,109.5877),
        Peak("Pikes Peak",38.8409,-105.0423),
        Peak("Mount Rainier", 46.879967, -121.726906))}

fun distanceFromBozeman(peak: Peak) : Double {
		return haversine( 45.6770, -111.0429, peak.latitude, peak.longitude)}

//The following is the haversine function you should incorporate to find the distances.
//Calculates the distance in km between two points on a globe
//Implementation from http://rosettacode.org/wiki/Haversine_formula
fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
        val R = 6372.8 // in kilometers
        val l1 = Math.toRadians(lat1)
        val l2 = Math.toRadians(lat2)
        val dl = Math.toRadians(lat2 - lat1)
        val dr = Math.toRadians(lon2 - lon1)
        return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) +
        Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}

fun main() {
    	println("**********Step Two**********")
        var peakLocations = listPeaks()
    	val peakItr = peakLocations.listIterator()
    	while (peakItr.hasNext()) {
        	println(peakItr.next())
    	}

    	println("**********Step Three**********")
        var whitetail = peakLocations[2]
    	println("\n The distance between Bozeman and Whitetail is " + distanceFromBozeman(whitetail) + " km" + "\n")


    	println("**********Step Four**********")
    	println("\n A new list with the distances of all peaks in the list to Bozeman:\n")
    	println(peakLocations.map { peak -> distanceFromBozeman(peak) })


    	println("\n" + "**********Step Five**********")
    	println("List of Peaks over 500km from Bozeman")
    	var distance = peakLocations.filter { peak -> distanceFromBozeman(peak) > 500 }
    	for (peak in distance) {
        	println(peak.name)
		}

    	println("\n" + "**********Step Six**********")
    	var western = peakLocations.filter { it -> it.longitude > -109.9541 }.map { it -> it.name }
    	println(western)


    	println("\n" + "**********Step Seven**********")
    	var furthest = peakLocations.maxByOrNull { distanceFromBozeman(it) }
    	println("Max distance: " + furthest + "\n")



    	println("**********Step Eight**********")
    	var mappedPeaks: Map<String, Peak> = peakLocations.map { it.name to it }.toMap()
    	mappedPeaks.forEach{
        	name, peak -> println("Name $name: Peak $peak")
    	}
    	var myPeak = "Gallatin Peak"
    	if(mappedPeaks.containsKey(myPeak)) {
        	println("The latitude for $myPeak is " + mappedPeaks.getValue(myPeak).latitude)
    	}
}
