from flask import Flask, request, jsonify

app = Flask(__name__)

todos = []

@app.get("/todos")
def get_todos():
    return jsonify(todos)

@app.post("/todos")
def add_todo():
    task = request.json.get("task")
    todos.append(task)
    return jsonify({"message": "Task added!"})

@app.delete("/todos/<int:index>")
def delete_task(index):
    if 0 <= index < len(todos):
        todos.pop(index)
        return jsonify({"message": "Task deleted!"})
    return jsonify({"error": "Invalid index"}), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
