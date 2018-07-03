package edu.job.project.util;


import org.springframework.stereotype.Component;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

import edu.job.project.domain.OffLec;

@Component
public class MapUtil {

	
	public Float[] geoCoding(OffLec offlecture) {
		
		if(offlecture.getLocation() ==null) {
			return null;
		}
		
		Geocoder geocoder = new Geocoder();
		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder()
				.setAddress(offlecture.getLocation())
				.setLanguage("ko")
				.getGeocoderRequest();
		
		GeocodeResponse geocodeResponse;
		
		try {
			geocodeResponse = geocoder.geocode(geocoderRequest);
			if(geocodeResponse.getStatus() == GeocoderStatus.OK & !geocodeResponse.getResults().isEmpty()) {
				GeocoderResult geocoderResult = geocodeResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
				
				Float[] coords = new Float[2];
				coords[0] = latitudeLongitude.getLat().floatValue();
				coords[1] = latitudeLongitude.getLng().floatValue();
				
				return coords;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
