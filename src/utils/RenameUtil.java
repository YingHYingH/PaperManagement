package utils;

import java.util.Calendar;

public class RenameUtil {
	public static String TimeRename() {
		Calendar c = Calendar.getInstance();
		String TimeRename = null;
		int year, month, date, hour, minute, second;
		String S_year, S_month, S_date, S_hour, S_minute, S_second;
		year = c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH) + 1;
		date = c.get(Calendar.DATE);
		hour = c.get(Calendar.HOUR);
		minute = c.get(Calendar.MINUTE);
		second = c.get(Calendar.SECOND);
		S_year = year + "";
		S_month = (month < 10 ? ("0" + month) : ("" + month));
		S_date = (date < 10 ? ("0" + date) : ("" + date));
		S_hour = (hour < 10 ? ("0" + hour) : ("" + hour));
		S_minute = (minute < 10 ? ("0" + minute) : ("" + minute));
		S_second = (second < 10 ? ("0" + second) : ("" + second));

		TimeRename = S_year + S_month + S_date + S_hour + S_minute + S_second;

		return TimeRename;
	}

}
