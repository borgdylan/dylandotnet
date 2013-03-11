//compile time flags
#if CLR_2 then
	#define NET_3_5
#elseif CLR_4 then
	#define NET_3_5
	#define NET_4_0
	#define NET_4_5
end #if

#define DEBUG
