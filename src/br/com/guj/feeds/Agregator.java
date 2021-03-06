package br.com.guj.feeds;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import br.com.guj.Config;
import de.nava.informa.core.ItemIF;

public class Agregator {
	private final String intervalKey;
	private final String maxItemsKey;
	private final String feedUrl;
	private List<ItemIF> items = new ArrayList<ItemIF>();

	public Agregator(String intervalKey, String maxItemsKey, String feedUrl) {
		this.intervalKey = intervalKey;
		this.maxItemsKey = maxItemsKey;
		this.feedUrl = feedUrl;

		this.init();
	}

	public List<ItemIF> getItems() {
		return this.items;
	}

	private void init() {
		 long interval = Config.getIntvalue(this.intervalKey) * 1000 * 60;

	        Timer infoqTimer = new Timer(true);
	        infoqTimer.scheduleAtFixedRate(new TimerTask() {
	            @Override
	            public void run() {
	            	try {
		                items = new ArrayList<ItemIF>(FeedReader.read(Config.getValue(feedUrl)));

		                int max = Config.getIntvalue(maxItemsKey);

		                if (items.size() > max) {
		                	items = items.subList(0, max);
		                }
	            	}
	            	catch (Exception e) {
	            		e.printStackTrace();
	            	}
	            }
	        }, new Date(), interval);
	}
}
