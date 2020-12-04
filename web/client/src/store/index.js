import { createStore } from "vuex";
import io from 'socket.io-client';
import router from '../router';

export default createStore({
  state: {
    auth: 'login',
    logged: false,
    socket: io('ws://127.0.0.1', { transports: ['websocket'] }),
    data: {
      pots: [],
      useditems: [],
      users: [],
      sessions: [],
      entities: [],
    },
    user: {}
  },
  getters: {
    isAuthenticated(state) {
      return state.logged == true;
    },
    getUser(state) {
      return state.user;
    },
    getMessages(state) {
      return state.messages;
    },
    getContacts(state) {
      return state.contacts;
    }
  },
  setters: {
    setUser(state, user) {
      state.user = user;
    }
  },
  mutations: {
    logout(state) {
      localStorage.removeItem('token');
      state.logged = false;
      state.auth = 'login';
      state.user = {};
      state.socket.emit('logout');

      router.push('/auth');
    }
  },
  actions: {
    logout(context) {
      context.commit('logout')
    }
  }
});