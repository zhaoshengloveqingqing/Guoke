{html}
	{head title='Not Found!'}
	{/head}
	{body}
		{ul items=$error}
			{literal}
			{li}
				{h2}{$item->cause} Not Found!{/h2}
				{ul items=$item->message}{/ul}
			{/li}
			{/literal}
		{/ul}
	{/body}
{/html}
