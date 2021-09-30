*** Variables ***
&{dictProductListPageApp}
...    btn_apply_filter=android=UiSelector().resourceIdMatches(".*id/buttonApply$")
...    txt_filter_option=android=UiSelector().text("{filter_option}")
...    icon_filter=android=UiSelector().resourceIdMatches(".*id/buttonFilter$")
...    txt_filter_type=android=UiSelector().text("{filter_type}")
...    txt_total_items=android=UiSelector().resourceIdMatches(".*id/textViewCount$")
...    icon_gif_loading=android=UiSelector().resourceIdMatches(".*id/progressBar$")