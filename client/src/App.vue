<template>
  <div id="app">
    <h1>ToDo</h1>
    <div v-for="todo in todos">
      <p v-bind:class="{ done: todo.done }">{{todo.description}} <a href="#" v-if="!todo.done" v-on:click="markAsDone(todo)">DONE</a></p>
    </div>

    <h2>Add another Todo</h2>
    <form>
      <input type="text" size="100" v-model="description">
      <button v-on:click="addTodo()">Add</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'app',

  data () {
    return {
      description: '',
      todos: []
    }
  },

  mounted () {
    this.fetchTodos()
  },

  methods: {
    addTodo () {
      this.$http.post('http://localhost:4000/api/todos', {todo: {description: this.$data.description}}).then((response) => {
        this.$data.todos.push(response.data.data)
      })
      return false
    },
    markAsDone (todo) {
      todo.done = true
      this.$http.put('http://localhost:4000/api/todos/' + todo.id, {todo: todo})
    },
    fetchTodos () {
      // var todos = [{description: 'JLgDHfjdh'}]
      this.$http.get('http://localhost:4000/api/todos').then((response) => {
        this.$data.todos = response.data.data
      })

      // todos
      // console.log('DONE')
    }
  }
  // components: {
  //   Hello
  // }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
p.done { text-decoration: line-through; }
</style>
