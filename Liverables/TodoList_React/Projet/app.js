// Composant : Tâche
class Task extends React.Component {
   

  render() {
      let class_name = 'task'
      class_name += this.props.done == 1 ? ' task-success' : ' task-info';

      return (
          <div className={class_name} onClick={this.props.onClickTask}>
              <span>{this.props.value}</span>
              <i className="close" onClick={this.props.onClickClose}>&times;</i>
          </div>
      )
  }
}

// Application
class App extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
       taskList: []
    };
  }
  componentDidMount() {
    this.chargementDonnees();
  }
  chargementDonnees(){

    var dataList = null;
    
    // affichage de données par Ajax

    $.getJSON( "API/fetch.php", 
    function( data ) {
      this.setState({ taskList: data});
    }.bind(this))
    .fail(function(jqXHR, textStatus, errorThrown) 
    {
       console.log(errorThrown);
   })
    ;
 
  }

  
  addTask(e) {

    $.ajax({
      url:"/API/add.php",
      method:"POST",
      data:{
          taskName : addInput.value ,
      },
      success:function(data) {
        this.chargementDonnees()
        console.log(data)
    }.bind(this)
    })
    e.preventDefault()
  }

  removeTask(i) {
    $.ajax({
      url:"/API/remove.php",
      method:"POST",
      data:{
        id :i
      },
      success:function(data) {
        $(this).parent().remove();
        this.chargementDonnees()
      }.bind(this)
    })
    
}
     

markDone(i,state) {
  if(state!=1){
    $.ajax({
    url:"/API/edit.php",
    method:"POST",
    data:{
        id : i,
        done :1 ,
    },
    success:function(data) {
      this.chargementDonnees()
    }.bind(this)
    })
  }else{
      $.ajax({
        url:"/API/edit.php",
        method:"POST",
        data:{
            id : i,
            done :0 ,
        },
        success:function(data) {
          this.chargementDonnees()}
        .bind(this)
        })
      
    }
  // task.done ? tasksArray.push(task) : tasksArray.unshift(task)
}

  render() {
   
    let tasksArrayMap = this.state.taskList.map((task, i) => {
      return (
        <Task 
          key={i}
          value={task.taskName}
          done={task.done}
          onClickClose={this.removeTask.bind(this, task.id)}
          onClickTask={this.markDone.bind(this, task.id,task.done)}
        />
      )
    })

    return (
      <div className="container">
        <div className="row">
          <div className="col-sm-6 col-sm-offset-3">
            <h1> Quel est le plan pour aujourd'hui ?</h1>
            <form
              id="form-add"
              className="form-horizontal" onSubmit={this.addTask.bind(this)}>
              <div className="input-group">
                <input type="text" id="addInput" className="form-control"  placeholder="Enterz une task..." />
                <div className="input-group-btn">
                  <button type="submit" className="btn btn-default">
                    <span className="glyphicon glyphicon-plus-sign"></span>
                  </button>
                </div>
              </div>
            </form>

            {tasksArrayMap}
                        
          </div>
        </div>
      </div>
    )
  }
}

ReactDOM.render(<App />, document.getElementById('app'));