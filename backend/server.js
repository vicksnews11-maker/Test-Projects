const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());

mongoose.connect(process.env.MONGO_URL)
  .then(() => console.log("MongoDB Connected"))
  .catch(err => console.log(err));

const productSchema = new mongoose.Schema({
  name: String,
  price: Number
});

const Product = mongoose.model("Product", productSchema);

app.get("/products", async (req, res) => {
  const data = await Product.find();
  res.json(data);
});

app.listen(5000, () => console.log("Backend running on port 5000"));
