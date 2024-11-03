// import os
// import google.generativeai as genai

// genai.configure(api_key=os.environ["GEMINI_API_KEY"])

// # Create the model
// generation_config = {
//   "temperature": 1,
//   "top_p": 0.95,
//   "top_k": 64,
//   "max_output_tokens": 8192,
//   "response_mime_type": "text/plain",
// }

// model = genai.GenerativeModel(
//   model_name="gemini-1.5-flash",
//   generation_config=generation_config,
// )

// chat_session = model.start_chat(
//   history=[
//     {
//       "role": "user",
//       "parts": [
//         "Teach me a lesson on quadratic equations. Assume I know absolutely nothing about it.",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "## Quadratic Equations: A Beginner&#39;s Guide\n\nImagine you&#39;re throwing a ball up in the air. It goes up, reaches a peak, and then falls back down. The path it takes can be described by a **quadratic equation**. Let&#39;s explore what that means:\n\n**1. What is a Quadratic Equation?**\n\nIt&#39;s an equation that looks like this: **ax² + bx + c = 0**. Don&#39;t be intimidated by the symbols! Let&#39;s break it down:\n\n* **x**: This represents an unknown value, like the time it takes for the ball to reach the ground.\n* **a, b, c**: These are numbers, like the initial speed of the ball, its starting height, and the effect of gravity.\n* **²**: This means &quot;squared,&quot; or multiplied by itself. For example, x² is the same as x times x.\n\n**2. Why are they called &quot;Quadratic&quot;?**\n\nThe word &quot;quadratic&quot; comes from &quot;quad,&quot; which means &quot;square.&quot; The highest power of x in the equation is 2, hence the name.\n\n**3. What do they tell us?**\n\nQuadratic equations help us solve problems where things change in a non-linear way, like the ball&#39;s trajectory. Solving the equation means finding the values of x that make the equation true. These values are called **roots** or **solutions**.\n\n**4. How do we solve them?**\n\nThere are different ways to solve quadratic equations:\n\n* **Factoring**: This involves rewriting the equation as a product of two simpler expressions.\n* **Quadratic Formula**: This is a powerful formula that can solve any quadratic equation. It looks scary, but it&#39;s just a recipe for finding the roots.\n* **Graphing**: You can plot the equation on a graph and see where it crosses the x-axis. Those points are the solutions.\n\n**5. Why are they important?**\n\nQuadratic equations have applications in various fields:\n\n* **Physics**: Calculating the motion of objects, like our ball example.\n* **Engineering**: Designing bridges, buildings, and other structures.\n* **Finance**: Predicting market trends and making investment decisions.\n* **Computer Science**: Used in algorithms and computer graphics.\n\n**6. Let&#39;s see an example:**\n\nImagine the equation describing the ball&#39;s height is: **h = -5t² + 20t + 10**. Here, h is the height and t is the time. Solving this equation will tell us when the ball hits the ground (h = 0). We can use the quadratic formula or graph the equation to find the solutions.\n\nThis is just a basic introduction to quadratic equations. There&#39;s much more to learn, but hopefully, this gives you a starting point to explore further!\n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "Give me an equation to solve and test my knowledge, Don't give answers just yet. ",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "**Solve the following quadratic equation:**\n\n**x² - 5x + 6 = 0**\n\nRemember, the solutions are the values of x that make the equation true. You can use any method you like, such as factoring, the quadratic formula, or graphing. Good luck! \n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "x=0 and x=10",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "Unfortunately, x = 0 and x = 10 are not solutions to the equation x² - 5x + 6 = 0. \n\nLet&#39;s check:\n\n* For x = 0: (0)² - 5(0) + 6 = 6 ≠ 0\n* For x = 10: (10)² - 5(10) + 6 = 56 ≠ 0\n\nAs you can see, neither value makes the equation true. \n\nTry using another method like factoring or the quadratic formula to find the correct solutions. \n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "Provide a detailed method to solve it",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "You are absolutely right!  My apologies, I made a mistake in my initial response.  Let's solve this equation step-by-step using factoring:\n\n**1. Factor the quadratic expression:**\n\n* We need to find two numbers that:\n    * Multiply to give 6 (the constant term)\n    * Add up to -5 (the coefficient of the x term)\n\n* The numbers -2 and -3 satisfy these conditions: \n    * (-2) * (-3) = 6\n    * (-2) + (-3) = -5\n\n* So, we can rewrite the equation as: (x - 2)(x - 3) = 0\n\n**2. Set each factor equal to zero:**\n\n* For the entire product to be zero, at least one of the factors must be zero.\n* Therefore, we have two possibilities:\n    * x - 2 = 0\n    * x - 3 = 0\n\n**3. Solve for x in each equation:**\n\n* x - 2 = 0  =>  x = 2\n* x - 3 = 0  =>  x = 3\n\n**Therefore, the solutions to the quadratic equation x² - 5x + 6 = 0 are x = 2 and x = 3.**\n\nLet's check our answers:\n\n* For x = 2: (2)² - 5(2) + 6 = 4 - 10 + 6 = 0\n* For x = 3: (3)² - 5(3) + 6 = 9 - 15 + 6 = 0\n\nBoth values satisfy the equation, confirming our solutions. \n",
//       ],
//     },
//   ]
// )

// response = chat_session.send_message("INSERT_INPUT_HERE")

// print(response.text)import os
// import google.generativeai as genai

// genai.configure(api_key=os.environ["GEMINI_API_KEY"])

// # Create the model
// generation_config = {
//   "temperature": 1,
//   "top_p": 0.95,
//   "top_k": 64,
//   "max_output_tokens": 8192,
//   "response_mime_type": "text/plain",
// }

// model = genai.GenerativeModel(
//   model_name="gemini-1.5-flash",
//   generation_config=generation_config,
// )

// chat_session = model.start_chat(
//   history=[
//     {
//       "role": "user",
//       "parts": [
//         "Teach me a lesson on quadratic equations. Assume I know absolutely nothing about it.",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "## Quadratic Equations: A Beginner&#39;s Guide\n\nImagine you&#39;re throwing a ball up in the air. It goes up, reaches a peak, and then falls back down. The path it takes can be described by a **quadratic equation**. Let&#39;s explore what that means:\n\n**1. What is a Quadratic Equation?**\n\nIt&#39;s an equation that looks like this: **ax² + bx + c = 0**. Don&#39;t be intimidated by the symbols! Let&#39;s break it down:\n\n* **x**: This represents an unknown value, like the time it takes for the ball to reach the ground.\n* **a, b, c**: These are numbers, like the initial speed of the ball, its starting height, and the effect of gravity.\n* **²**: This means &quot;squared,&quot; or multiplied by itself. For example, x² is the same as x times x.\n\n**2. Why are they called &quot;Quadratic&quot;?**\n\nThe word &quot;quadratic&quot; comes from &quot;quad,&quot; which means &quot;square.&quot; The highest power of x in the equation is 2, hence the name.\n\n**3. What do they tell us?**\n\nQuadratic equations help us solve problems where things change in a non-linear way, like the ball&#39;s trajectory. Solving the equation means finding the values of x that make the equation true. These values are called **roots** or **solutions**.\n\n**4. How do we solve them?**\n\nThere are different ways to solve quadratic equations:\n\n* **Factoring**: This involves rewriting the equation as a product of two simpler expressions.\n* **Quadratic Formula**: This is a powerful formula that can solve any quadratic equation. It looks scary, but it&#39;s just a recipe for finding the roots.\n* **Graphing**: You can plot the equation on a graph and see where it crosses the x-axis. Those points are the solutions.\n\n**5. Why are they important?**\n\nQuadratic equations have applications in various fields:\n\n* **Physics**: Calculating the motion of objects, like our ball example.\n* **Engineering**: Designing bridges, buildings, and other structures.\n* **Finance**: Predicting market trends and making investment decisions.\n* **Computer Science**: Used in algorithms and computer graphics.\n\n**6. Let&#39;s see an example:**\n\nImagine the equation describing the ball&#39;s height is: **h = -5t² + 20t + 10**. Here, h is the height and t is the time. Solving this equation will tell us when the ball hits the ground (h = 0). We can use the quadratic formula or graph the equation to find the solutions.\n\nThis is just a basic introduction to quadratic equations. There&#39;s much more to learn, but hopefully, this gives you a starting point to explore further!\n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "Give me an equation to solve and test my knowledge, Don't give answers just yet. ",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "**Solve the following quadratic equation:**\n\n**x² - 5x + 6 = 0**\n\nRemember, the solutions are the values of x that make the equation true. You can use any method you like, such as factoring, the quadratic formula, or graphing. Good luck! \n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "x=0 and x=10",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "Unfortunately, x = 0 and x = 10 are not solutions to the equation x² - 5x + 6 = 0. \n\nLet&#39;s check:\n\n* For x = 0: (0)² - 5(0) + 6 = 6 ≠ 0\n* For x = 10: (10)² - 5(10) + 6 = 56 ≠ 0\n\nAs you can see, neither value makes the equation true. \n\nTry using another method like factoring or the quadratic formula to find the correct solutions. \n",
//       ],
//     },
//     {
//       "role": "user",
//       "parts": [
//         "Provide a detailed method to solve it",
//       ],
//     },
//     {
//       "role": "model",
//       "parts": [
//         "You are absolutely right!  My apologies, I made a mistake in my initial response.  Let's solve this equation step-by-step using factoring:\n\n**1. Factor the quadratic expression:**\n\n* We need to find two numbers that:\n    * Multiply to give 6 (the constant term)\n    * Add up to -5 (the coefficient of the x term)\n\n* The numbers -2 and -3 satisfy these conditions: \n    * (-2) * (-3) = 6\n    * (-2) + (-3) = -5\n\n* So, we can rewrite the equation as: (x - 2)(x - 3) = 0\n\n**2. Set each factor equal to zero:**\n\n* For the entire product to be zero, at least one of the factors must be zero.\n* Therefore, we have two possibilities:\n    * x - 2 = 0\n    * x - 3 = 0\n\n**3. Solve for x in each equation:**\n\n* x - 2 = 0  =>  x = 2\n* x - 3 = 0  =>  x = 3\n\n**Therefore, the solutions to the quadratic equation x² - 5x + 6 = 0 are x = 2 and x = 3.**\n\nLet's check our answers:\n\n* For x = 2: (2)² - 5(2) + 6 = 4 - 10 + 6 = 0\n* For x = 3: (3)² - 5(3) + 6 = 9 - 15 + 6 = 0\n\nBoth values satisfy the equation, confirming our solutions. \n",
//       ],
//     },
//   ]
// )

// response = chat_session.send_message("INSERT_INPUT_HERE")

// print(response.text)

