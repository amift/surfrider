<template>
  <div id="sidebar" class="col-md-3">
		<div class="sidebar row">
			<logo-box />
			<user-box v-bind:username="get('username')" v-bind:about="get('about')" v-bind:avatar="get('avatar')"/>
			<contacts-box />
		</div>
  </div>
</template>

<script>
import Contacts from './Contacts.vue';
import UserBox from '../partials/UserBox.vue';
import Logo from '../partials/Logo.vue';

export default {
	name: 'Sidebar',
	components: {
		'logo-box': Logo,
		'user-box': UserBox,
		'contacts-box': Contacts,
	},
	methods:{
		get(key){
			if (this.$store.getters == undefined) return key;
			if (this.$store.getters.getUser == null) return key;
			return this.$store.getters.getUser[key];
		}
	}
	
}
</script>


<style scoped>
.sidebar{
	margin: 10px 0 0 10px;
}
</style>