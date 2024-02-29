import SpriteKit


// Here is the scene
class GameScene: SKScene, SKPhysicsContactDelegate {

    // Player variable
    var brownie: SKSpriteNode!

    // Player animations
    var idleAnimation: SKAction!
    var walkAnimation: SKAction!

    // Player status
    var brownieStatus: BrownieStatus = .walking
    
    //score (completed?)
    var fase: Int = 0
    
    //hehe
    var cathedral: SKSpriteNode!
    var museum: SKSpriteNode!
    var botanical: SKSpriteNode!
    
    //menu
    var menuImage: SKSpriteNode!
    var menuAnimation: SKAction!
    
    //end
    var endImage: SKSpriteNode!
    var endAnimation: SKAction!
    
    var icone: SKSpriteNode!
    
    //Buttons!
    var bDraw: SKSpriteNode!
    var bStart: SKSpriteNode!
    var bContinue: SKSpriteNode!
    
    //Points list
    var passedPoints: [SKShapeNode:Bool] = [:]
    var template:SKSpriteNode!
    
    //background
    var fundo: SKSpriteNode!
    
    var template1 = SKSpriteNode(imageNamed: "Template1")
    var template2 = SKSpriteNode(imageNamed: "Template2")
    var template3 = SKSpriteNode(imageNamed: "Template3")
    
    //For drawing
    var previousLocation: CGPoint?
    var path: CGMutablePath!
    var pathNodes: [SKShapeNode] = []
    var canDraw = false
    
    var paintingBrownie = SKSpriteNode(imageNamed: "SittingHBrush")
    var easel = SKSpriteNode(imageNamed: "Easel")
    
    //Useful
    var wait = SKAction.wait(forDuration: 8)
    var FadeIn = SKAction.fadeIn(withDuration: 0.5)
    var FadeOut = SKAction.fadeOut(withDuration: 1)
    var bye = SKAction.removeFromParent()
    var start = false
    var continuar = false
    var done = false
    var moverMonumento = SKAction.moveTo(x: -1024, duration: 4)
    var moverTemplate = SKAction.moveTo(x: 1024, duration: 4)
    var moverFundo1 = SKAction.moveTo(x: 1024, duration: 4)
    var moverFundo2 = SKAction.moveTo(x: -1024, duration: 4)
    
    //intro
    var introScene = false
    var pressed: Int = 0
    var image1 = SKSpriteNode(imageNamed: "intro1")
    var image2 = SKSpriteNode(imageNamed: "intro2")
    var image3 = SKSpriteNode(imageNamed: "intro3")
    var image4 = SKSpriteNode(imageNamed: "intro4")
    var image5 = SKSpriteNode(imageNamed: "intro5")
    var image6 = SKSpriteNode(imageNamed: "intro6")
    var image7 = SKSpriteNode(imageNamed: "intro7")
    var tapimg = SKSpriteNode(imageNamed: "tapimage")
    
    var tutorial = SKSpriteNode(imageNamed: "tutorial")
    
    var conv1: Int = 0
    
    var transitionImage = SKSpriteNode(imageNamed: "transition")
    
    //Dialogues
    var cutscene = false
    
    var dialogue1 = false
    var dialogue2 = false
    var dialogue3 = false
    var dialogue4 = false
    
    var ending = false
    
    var dial1 = SKSpriteNode(imageNamed: "dialogue1")
    var dial2 = SKSpriteNode(imageNamed: "dialogue2")
    var dial3 = SKSpriteNode(imageNamed: "dialogue3")
    var dial4 = SKSpriteNode(imageNamed: "dialogue4")
    var dial5 = SKSpriteNode(imageNamed: "dialogue5")
    var dial6 = SKSpriteNode(imageNamed: "dialogue6")
    
    var dial7 = SKSpriteNode(imageNamed: "dialogue7")
    var dial8 = SKSpriteNode(imageNamed: "dialogue8")
    var dial9 = SKSpriteNode(imageNamed: "dialogue9")
    
    var dial10 = SKSpriteNode(imageNamed: "dialogue10")
    var dial11 = SKSpriteNode(imageNamed: "dialogue11")
    var dial12 = SKSpriteNode(imageNamed: "dialogue12")
    
    var dial13 = SKSpriteNode(imageNamed: "dialogue13")
    var dial14 = SKSpriteNode(imageNamed: "dialogue14")
    var dial15 = SKSpriteNode(imageNamed: "dialogue15")
    var dial16 = SKSpriteNode(imageNamed: "dialogue16")
    var dial17 = SKSpriteNode(imageNamed: "dialogue17")
    var dial18 = SKSpriteNode(imageNamed: "dialogue18")
    
    var dial19 = SKSpriteNode(imageNamed: "dialogue19")
    var dial20 = SKSpriteNode(imageNamed: "dialogue20")
    var dial21 = SKSpriteNode(imageNamed: "dialogue21")
    var dial22 = SKSpriteNode(imageNamed: "dialogue22")
    
    //Main
    override func didMove(to view: SKView) {
        music()
        
        menuImage = SKSpriteNode(imageNamed: "menu1")
        menuImage.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        addChild(menuImage)
        
        endImage = SKSpriteNode(imageNamed: "menu1")
        endImage.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        endImage.zPosition = 20
        endImage.alpha = 0
        addChild(endImage)
        
        setupMenuAnimation()
        menuImage.run(menuAnimation)
        
        setupEndAnimation()
        endImage.run(endAnimation)
        
        bStart = SKSpriteNode(imageNamed: "bPlay1")
        bStart.zPosition = 4
        bStart.setScale(1.2)
        bStart.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * 0.3)
        bStart.alpha = 1
        addChild(bStart)
        
        icone = SKSpriteNode(imageNamed: "icone")
        icone.zPosition = 21
        icone.setScale(1.3)
        icone.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.25)
        icone.alpha = 0
        addChild(icone)
        
        bDraw = SKSpriteNode(imageNamed: "bPaint1")
        bDraw.zPosition = 5
        bDraw.setScale(1)
        bDraw.position = CGPoint(x: 3000, y: 3000)
        bDraw.alpha = 0
        addChild(bDraw)
        
        fundo = SKSpriteNode(imageNamed: "fundo")
        fundo.zPosition = 2
        fundo.setScale(1)
        fundo.position = CGPoint(x: 3072, y: self.size.height * 0.5)
        fundo.alpha = 0
        addChild(fundo)
        
        image1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image1.setScale(1)
        image1.zPosition = 10
        image1.alpha = 0
        addChild(image1)
        
        image2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image2.setScale(1)
        image2.zPosition = 11
        image2.alpha = 0
        addChild(image2)
        
        image3.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image3.setScale(1)
        image3.zPosition = 12
        image3.alpha = 0
        addChild(image3)
        
        image4.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image4.setScale(1)
        image4.zPosition = 13
        image4.alpha = 0
        addChild(image4)
        
        image5.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image5.setScale(1)
        image5.zPosition = 14
        image5.alpha = 0
        addChild(image5)
        
        image6.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image6.setScale(1)
        image6.zPosition = 15
        image6.alpha = 0
        addChild(image6)
        
        image7.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        image7.setScale(1)
        image7.zPosition = 15
        image7.alpha = 0
        addChild(image7)
        
        tutorial.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        tutorial.setScale(1)
        tutorial.zPosition = 15
        tutorial.alpha = 0
        addChild(tutorial)
        
        tapimg.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        tapimg.setScale(1)
        tapimg.zPosition = 20
        tapimg.alpha = 0
        addChild(tapimg)
        
        //Dialogues!!!
        dial1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial1.setScale(1)
        dial1.alpha = 0
        dial1.zPosition = 10
        addChild(dial1)
        
        dial2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial2.setScale(1)
        dial2.alpha = 0
        dial2.zPosition = 11
        addChild(dial2)
        
        dial3.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial3.setScale(1)
        dial3.alpha = 0
        dial3.zPosition = 12
        addChild(dial3)
        
        dial4.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial4.setScale(1)
        dial4.alpha = 0
        dial4.zPosition = 13
        addChild(dial4)
        
        dial5.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial5.setScale(1)
        dial5.alpha = 0
        dial5.zPosition = 15
        addChild(dial5)
        
        dial6.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial6.setScale(1)
        dial6.alpha = 0
        dial6.zPosition = 15
        addChild(dial6)
        
        //templates
        template1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        template1.setScale(1)
        template1.zPosition = 4
        template1.alpha = 0
        addChild(template1)
        
        template2.position = CGPoint(x: 3072, y: self.size.height * 0.5)
        template2.setScale(1)
        template2.zPosition = 4
        template2.alpha = 0.7
        addChild(template2)
        
        template3.position = CGPoint(x: 3072, y: self.size.height * 0.5)
        template3.setScale(1)
        template3.zPosition = 4
        template3.alpha = 0.7
        addChild(template3)
        
        dial7.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial7.setScale(1)
        dial7.alpha = 0
        dial7.zPosition = 15
        addChild(dial7)
        
        dial8.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial8.setScale(1)
        dial8.alpha = 0
        dial8.zPosition = 15
        addChild(dial8)
        
        dial9.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial9.setScale(1)
        dial9.alpha = 0
        dial9.zPosition = 15
        addChild(dial9)
        
        
        dial10.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial10.setScale(1)
        dial10.alpha = 0
        dial10.zPosition = 15
        addChild(dial10)
        
        dial11.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial11.setScale(1)
        dial11.alpha = 0
        dial11.zPosition = 15
        addChild(dial11)
        
        dial12.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial12.setScale(1)
        dial12.alpha = 0
        dial12.zPosition = 15
        addChild(dial12)
        
        dial13.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial13.setScale(1)
        dial13.alpha = 0
        dial13.zPosition = 10
        addChild(dial13)
        
        dial14.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial14.setScale(1)
        dial14.alpha = 0
        dial14.zPosition = 11
        addChild(dial14)
        
        dial15.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial15.setScale(1)
        dial15.alpha = 0
        dial15.zPosition = 12
        addChild(dial15)
        
        dial16.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial16.setScale(1)
        dial16.alpha = 0
        dial16.zPosition = 13
        addChild(dial16)
        
        dial17.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial17.setScale(1)
        dial17.alpha = 0
        dial17.zPosition = 14
        addChild(dial17)
        
        dial18.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial18.setScale(1)
        dial18.alpha = 0
        dial18.zPosition = 15
        addChild(dial18)
        
        dial19.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial19.setScale(1)
        dial19.alpha = 0
        dial19.zPosition = 16
        addChild(dial19)
        
        dial20.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial20.setScale(1)
        dial20.alpha = 0
        dial20.zPosition = 17
        addChild(dial20)
        
        dial21.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial21.setScale(1)
        dial21.alpha = 0
        dial21.zPosition = 18
        addChild(dial21)
        
        dial22.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        dial22.setScale(1)
        dial22.alpha = 0
        dial22.zPosition = 19
        addChild(dial22)
        
    }
    func music() {
        run(.playSoundFileNamed("Sandwich-Bossa(looped).mp3", waitForCompletion: false))
    }
    
    func game() {
        intro()
        
        // Player configs
        brownie = SKSpriteNode(imageNamed: "Idle1")
        brownie.setScale(0.9)
        brownie.zPosition = 5
        brownie.position = CGPoint(x: 340, y: 350)
        brownie.alpha = 1
        self.addChild(brownie)
        callBrownie()
        
        fundo.alpha = 1

        setupBackgroundAnimation()
        setupIdleAnimation()
        setupWalkAnimation()

        brownie.run(idleAnimation)
        
        paintingBrownie.position = CGPoint(x: 210, y: -350)
        paintingBrownie.zPosition = 10
        paintingBrownie.setScale(1)
        paintingBrownie.alpha = 1
        addChild(paintingBrownie)
        
        easel.position = CGPoint(x: 1930, y: -400)
        easel.zPosition = 10
        easel.setScale(1)
        easel.alpha = 1
        addChild(easel)
        
    }
    
    //Move Brownie
    func callBrownie() {
        let esperar = 2.0
        let moveUp = SKAction.moveTo(y: 340, duration: 2)
        let moveSide = SKAction.moveTo(x: 350, duration: 2)
        
        brownie.run(moveUp)
        brownie.run(moveSide)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + esperar) {
            self.brownie.run(self.idleAnimation)
        }
        
    }
    
    func byeBrownie() {
        let moveDown = SKAction.moveTo(y: -550, duration: 2)
        let moveSide = SKAction.moveTo(x: 150, duration: 2)
        brownie.run(walkAnimation)
        brownie.run(moveDown)
        brownie.run(moveSide)
    }
    
    //Menu animations
    
    func moveMenu() {

        // Executamos a animação de caminhada
        menuImage.run(menuAnimation)
    }
    
    func setupMenuAnimation() {
        // Animação de caminhada do personagem

        // Criamos uma lista com todas texturas (imagens ordenadas de todos os frames da caminhada)
        var menuList = [SKTexture]()

        // Cada imagem é adicionada à lista
        menuList.append(SKTexture(imageNamed: "menu1"))
        menuList.append(SKTexture(imageNamed: "menu2"))


        // Criamos a animação que troca as imagens em um determinado intervalo de tempo.
        let menu = SKAction.animate(with: menuList,
                                         timePerFrame: 0.5,
                                         resize: true,
                                         restore: true)

        // Criamos uma repetição para a animação de caminhada e atribuímos à variável "walkAnimation"
        menuAnimation = SKAction.repeatForever(menu)
    }
    
    //End animations
    
    func moveEnd() {

        // Executamos a animação de caminhada
        endImage.run(endAnimation)
    }
    
    func setupEndAnimation() {
        // Animação de caminhada do personagem

        // Criamos uma lista com todas texturas (imagens ordenadas de todos os frames da caminhada)
        var endList = [SKTexture]()

        // Cada imagem é adicionada à lista
        endList.append(SKTexture(imageNamed: "end1"))
        endList.append(SKTexture(imageNamed: "end2"))


        // Criamos a animação que troca as imagens em um determinado intervalo de tempo.
        let end = SKAction.animate(with: endList,
                                         timePerFrame: 0.5,
                                         resize: true,
                                         restore: true)

        // Criamos uma repetição para a animação de caminhada e atribuímos à variável "walkAnimation"
        endAnimation = SKAction.repeatForever(end)
    }
    
    //Brownie animations
    func idle() {
        // Se o personagem já está parado, interrompemos a função
        if brownieStatus == .idle {
            return // Interrompe a função
        }

        // Removemos todas as animações existente.
        brownie.removeAllActions()

        // Mudamos o estado do personagem para sabermos que agora ele está caminhando
        brownieStatus = .idle

        // Executamos a animação de caminhada
        brownie.run(idleAnimation)
    }
    
    func setupIdleAnimation() {
        // Animação de caminhada do personagem

        // Criamos uma lista com todas texturas (imagens ordenadas de todos os frames da caminhada)
        var idleList = [SKTexture]()

        // Cada imagem é adicionada à lista
        idleList.append(SKTexture(imageNamed: "Idle1"))
        idleList.append(SKTexture(imageNamed: "Idle2"))


        // Criamos a animação que troca as imagens em um determinado intervalo de tempo.
        let idle = SKAction.animate(with: idleList,
                                         timePerFrame: 0.5,
                                         resize: true,
                                         restore: true)

        // Criamos uma repetição para a animação de caminhada e atribuímos à variável "walkAnimation"
        idleAnimation = SKAction.repeatForever(idle)
    }
    
    func walk() {
                // Função chamada no início da cena e cada vez que o personagem bate no chão de volta depois de dar um salto
                
                // Se o personagem já está caminhando, interrompemos a função
                if brownieStatus == .walking {
                    return // Interrompe a função
                }
                
                // Removemos todas as animações existente. No caso a animação de pulo é removida caso o personagem estiver voltando de um salto
                brownie.removeAllActions()
                
                // Mudamos o estado do personagem para sabermos que agora ele está caminhando
                brownieStatus = .walking
                
                // Executamos a animação de caminhada
                brownie.run(walkAnimation)
    }
    
    func setupWalkAnimation() {
                // Animação de caminhada do personagem
                
                // Criamos uma lista com todas texturas (imagens ordenadas de todos os frames da caminhada)
                var walkList = [SKTexture]()
                
                // Cada imagem é adicionada à lista
                walkList.append(SKTexture(imageNamed: "Walk1"))
                walkList.append(SKTexture(imageNamed: "Walk2"))
                walkList.append(SKTexture(imageNamed: "Walk3"))
                walkList.append(SKTexture(imageNamed: "Walk2"))
                
                // Criamos a animação que troca as imagens em um determinado intervalo de tempo.
                let walk = SKAction.animate(with: walkList,
                                            timePerFrame: 0.3,
                                            resize: true,
                                            restore: true)
                
                // Criamos uma repetição para a animação de caminhada e atribuímos à variável "walkAnimation"
                walkAnimation = SKAction.repeatForever(walk)
    }
    
    
    //Background
    
    func setupBackgroundAnimation() {
        // Aqui cada camada do background é configurada pela função setupLayer. Os números entre parênteses são parâmetros da função, que nesse caso representam cada uma das camadas. A camada 6 está "reservada" para o personagem. Veja a implementação dessa função mais para baixo nesse arquivo.
        setupLayer(1)
        //setupLayer(2)
        //setupLayer(3)
    }
    
    func setupLayer(_ layer: Int) {
        // Configuração das camadas do cenário

        // Carregamos duas imagens iguais para posicioná-las lado a lado (as imagens se encaixam perfeitamente)
        let sprite1 = SKSpriteNode(imageNamed: "bk\(layer)")
        let sprite2 = SKSpriteNode(imageNamed: "bk\(layer)")

        // Movemos a segunda imagem para que ela comece onde a primeira termina. As imagens possuem exatamente a mesma largura da tela
        sprite2.position = CGPoint(x: self.size.width, y: 0)

        // Criamos um elemento para receber os duas imagens como suas "filhas"
        let layerNode = SKNode()
        layerNode.addChild(sprite1)
        layerNode.addChild(sprite2)

        // Colocamos o elemento na camada referente ao parâmetro (layer) recebido no início da função.
        layerNode.zPosition = CGFloat(layer)

        // Posicionamos o elemento bem no centro da tela (a segunda imagem ficará posicionada para fora da tela para o lado direito. As duas imagens irão se deslocar para a esquerda fazendo com que uma saia da cena enquanto a outra entra)
        layerNode.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)

        // Cria a animação para mover as imagens do cenário para a esquerda. O tempo está definido como 3 * (10 - layer). A variável layer entra na conta para que os layers mais baixos se movam mais lentamente. Isso cria o efeito de paralaxe, que dá a impressão que o cenário tem profundidade. O 3 * é para ajustar a velocidade
        let moveLeft = SKAction.moveBy(x: -self.size.width, y: 0, duration: TimeInterval(4 * (10 - layer)))

        // Cria a animação para mover de volta as imagens do cenário para a direita instantaneamente, pois a duração é igual a 0 (zero)
        let moveBack = SKAction.moveBy(x: self.size.width, y: 0, duration: 0)

        // Cria a sequência para mover para e esquerda lentamente e de volta para a direita instantaneamente
        let sequence = SKAction.sequence([moveLeft, moveBack])

        // Cria um loop infinito da sequência criada acima
        let loop = SKAction.repeatForever(sequence)

        // Manda o nó "pai" executar a animação infinita
        layerNode.run(loop)

        // Adiciona o nó "pai" à cena
        self.addChild(layerNode)
    }
    
    //Sounds
    
    func popSounds() {
        let n = Int.random(in: 1...4)
        let sound = SKAction.playSoundFileNamed("pop\(n).mp3", waitForCompletion: false)
        run(sound)
    }
    
    //Drawing
    
    func addNewPath() {
        let pathNode = SKShapeNode()
        pathNode.strokeColor = getRandomColor()
        pathNode.lineWidth = 60
        pathNode.path = path
        pathNode.zPosition = 15
        
        pathNodes.append(pathNode)
        addChild(pathNode)
    }
    
    func getRandomColor() -> UIColor {
        let n = Int.random(in: 1...6)
        var color = UIColor(.white)
            
        switch n {
        case 1:
            color = UIColor(.red)
        case 2:
            color = UIColor(.orange)
        case 3:
            color = UIColor(.yellow)
        case 4:
            color = UIColor(.green)
        case 5:
            color = UIColor(.blue)
        case 6:
            color = UIColor(.purple)
        default:
            break
        }
        
        return color
    }
    
    func callButton() {
        bDraw.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.2)
        bDraw.run(FadeIn)
    }
    
    func byeButton() {
        bDraw.position = CGPoint(x: 3000, y: 3000)
    }
    
    func drawCat() {
        //template
        
        //outline
        
        var point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 1070)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 925, y: 1005)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 834, y: 930)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 834, y: 1070)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 788, y: 1237)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 742, y: 1404)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 696, y: 1237)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 650, y: 1070)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 650, y: 870)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 650, y: 670)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 650, y: 470)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 650, y: 270)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 834, y: 270)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 270)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //metade

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1123, y: 1005)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1214, y: 930)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1214, y: 1070)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1260, y: 1237)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1306, y: 1404)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1352, y: 1237)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1398, y: 1070)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1398, y: 870)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1398, y: 670)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1398, y: 470)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1398, y: 270)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1214, y: 270)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //circulo
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 916)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 935, y: 828)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 740)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1113, y: 828)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //porta

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 610)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 935, y: 528)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1113, y: 528)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 935, y: 400)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1113, y: 400)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //lado
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1545, y: 740)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1545, y: 546)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1545, y: 352)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

    }

    func drawMon() {
        //template
        
        
        //cima e baixo
        var point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 1428.5)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 650)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //pontas
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 308, y: 975)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1740, y: 975)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //esquerda em cima

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 835, y: 1405)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 660, y: 1338)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 520, y: 1235)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 400, y: 1120)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //direta em cima

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1213, y: 1405)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1388, y: 1338)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1528, y: 1235)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1648, y: 1120)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //direta em baixo

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1213, y: 665)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1380, y: 710)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1525, y: 775)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1648, y: 855)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //esquerda em baixo//

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 835, y: 665)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 665, y: 710)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 520, y: 775)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 400, y: 855)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        //caixa?
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1143, y: 600)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 903, y: 600)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1143, y: 430)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 903, y: 430)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1143, y: 265)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 903, y: 265)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 265)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
    }
    
    func drawBot() {
        
        
        //cima e baixo
        var point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 1263)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 898)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1024, y: 503)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //um
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 920, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 855, y: 1150)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 855, y: 1025)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 855, y: 900)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //dois
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1138, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1205, y: 1150)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1205, y: 1025)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1205, y: 900)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //tres
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1374, y: 1263)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1270, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1488, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1555, y: 1150)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1555, y: 1025)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1555, y: 900)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1374, y: 898)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //quatro
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 680, y: 1263)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 790, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 560, y: 1230)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 505, y: 1150)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 505, y: 1025)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 505, y: 900)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 680, y: 898)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //cinco
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 390, y: 865)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 325, y: 772)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 325, y: 630)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 325, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 500, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
                
        //seis
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1658, y: 865)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1723, y: 772)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1723, y: 630)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1723, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1548, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        //bottom
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 855, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1205, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1555, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 1374, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false

        point = SKShapeNode(circleOfRadius: 30)
        point.fillColor = .white
        point.position = CGPoint(x: 680, y: 505)
        point.zPosition = 2
        addChild(point)
        passedPoints[point] = false
        
    }
    
    func catDone() {
        cathedral = SKSpriteNode(imageNamed: "Cathedral")
        cathedral.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        cathedral.setScale(1)
        cathedral.zPosition = 4
        cathedral.alpha = 0
        addChild(cathedral)
        
        let sequence1 = SKAction.sequence([FadeIn])

        
        cathedral.run(sequence1)
        
        pressed = 0
        cutscene = true
        dialogue2 = true
        tapimg.run(FadeIn)
    }
    
    func monDone() {
        museum = SKSpriteNode(imageNamed: "Museum")
        museum.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        museum.setScale(1)
        museum.zPosition = 4
        museum.alpha = 0
        addChild(museum)

        
        let sequence1 = SKAction.sequence([FadeIn])
        
        
        
        museum.run(sequence1)
        
        pressed = 0
        cutscene = true
        dialogue3 = true
        tapimg.run(FadeIn)
    }
    
    func botDone() {
        botanical = SKSpriteNode(imageNamed: "Botanico")
        botanical.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        botanical.setScale(1)
        botanical.zPosition = 4
        botanical.alpha = 0
        addChild(botanical)
        
        let sequence1 = SKAction.sequence([FadeIn, wait])

        botanical.run(sequence1)
        
        pressed = 0
        cutscene = true
        dialogue4 = true
        tapimg.run(FadeIn)
    }
    
    func closerBrownie() {
        let esperar = 1.5
        let moveUp = SKAction.moveTo(y: 200, duration: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + esperar) {
            self.paintingBrownie.run(moveUp)
            self.easel.run(moveUp)
        }
    }
    
    func byeCloserBrownie() {
        let moveDown1 = SKAction.moveTo(y: -350, duration: 1)
        let moveDown2 = SKAction.moveTo(y: -400, duration: 1)
        paintingBrownie.run(moveDown1)
        easel.run(moveDown2)
    }
    
    func transition() {
        let tempo = SKAction.wait(forDuration: 0.5)
        let sequence = SKAction.sequence([FadeIn, tempo, FadeOut])
        transitionImage.run(sequence)
    }
    
    func end() {
        let endImage = SKSpriteNode(imageNamed: "fim")
        endImage.zPosition = 10
        endImage.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        addChild(endImage)
    }
    
    // Função que recebe a coordenada do ponto clicado na tela
    func touchDown(atPoint pos : CGPoint) {
        
        
        
        if bStart.contains(pos){
            run(.playSoundFileNamed("press.mp3", waitForCompletion: false))
            
            cutscene = true
            introScene = true
            
            bStart.position = CGPoint(x: 3000, y:3000)
            menuImage.position = CGPoint(x: 3000, y:3000)
            
            game()
        }
        
        if bDraw.contains(pos){
            run(.playSoundFileNamed("press.mp3", waitForCompletion: false))

            byeButton()
            byeBrownie()

            switch fase {
            case 0:
                closerBrownie()
                drawCat()
                fase += 1
            case 1:
                closerBrownie()
                drawMon()
                fase += 1
            case 2:
                closerBrownie()
                drawBot()
                fase += 1
            default:
                print("algo deu errado :0")
            }
            
            canDraw = true
        }
        
        if canDraw == true {
            path = CGMutablePath()
            path.move(to: pos)
            addNewPath()

            previousLocation = pos
        }
        
        if cutscene == true {
            
            print(pressed)
            
            if introScene == true {
                intro()
                
            }
            
            if dialogue1 == true {
                
                dialogueScene1()
            }
            
            if dialogue2 == true {
                
                dialogueScene2()
            }
            
            if dialogue3 == true {
                
                dialogueScene3()
            }
            
            if dialogue4 == true {
                
                dialogueScene4()
            }
            
            pressed += 1
        }
        
    }
    
    func intro() {
        let transitionTime = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([transitionTime, bye])
        let sequencebye = SKAction.sequence([FadeOut, transitionTime, bye])
        
        if pressed <= 8 {
            switch pressed{
            case 0:
                image1.alpha = 1
                tapimg.run(FadeIn)
            case 1:
                image2.run(FadeIn)
                image1.run(sequence)
            case 2:
                image3.run(FadeIn)
                image2.run(sequence)
            case 3:
                image4.run(FadeIn)
                image3.run(sequence)
            case 4:
                image5.run(FadeIn)
                image4.run(sequence)
            case 5:
                image6.run(FadeIn)
                image5.run(sequence)
            case 6:
                image7.run(FadeIn)
                image6.run(sequence)
            case 7:
                image7.run(sequencebye)
                
                introScene = false
                dialogue1 = true
                pressed = 0
                template1.alpha = 0.7
                
            default:
                print("done")
            }
        }
    }
    
    func dialogueScene1() {
        let transitionTime = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([transitionTime, bye])
        let sequencebye = SKAction.sequence([FadeOut, transitionTime, bye])
        
        if pressed <= 8 {
            switch pressed {
            case 1:
                dial1.run(FadeIn)
            case 2:
                dial2.alpha = 1
                dial1.run(sequence)
            case 3:
                dial3.alpha = 1
                dial2.run(sequence)
            case 4:
                dial4.alpha = 1
                dial3.run(sequence)
            case 5:
                dial5.alpha = 1
                dial4.run(sequence)
            case 6:
                dial6.alpha = 1
                dial5.run(sequence)
            case 7:
                dial6.run(sequencebye)
                tutorial.run(FadeIn)
            case 8:
                tutorial.run(FadeOut)
                tapimg.run(FadeOut)
                pressed = 0
                dialogue1 = false
                callButton()
            default:
                print("acabou")
                break
            }
        }
    }
    
    func dialogueScene2() {
        let transitionTime = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([transitionTime, bye])
        let sequencebye = SKAction.sequence([FadeOut, transitionTime, bye])
        let secondsToDelay = 4.0
        
        if pressed <= 7 {
            switch pressed {
            case 0:
                dial7.run(FadeIn)
            case 1:
                dial8.alpha = 1
                dial7.run(sequence)
            case 2:
                dial9.alpha = 1
                dial8.run(sequence)
            case 3:
                dial9.run(sequencebye)
                tapimg.run(FadeOut)
                pressed = 0
                
                brownie.run(self.walkAnimation)
            
                fundo.run(moverFundo1)
                cathedral.run(moverMonumento)
                template2.run(moverTemplate)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + (secondsToDelay)) {
                    self.brownie.run(self.idleAnimation)
                    self.callButton()
                }
                
                dialogue2 = false
                cutscene = false
    
            default:
                print("acabou2")
                break
            }
        }
    }
    
    func dialogueScene3() {
        let transitionTime = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([transitionTime, bye])
        let sequencebye = SKAction.sequence([FadeOut, transitionTime, bye])
        let secondsToDelay = 4.0
        
        if pressed <= 7 {
            switch pressed {
            case 0:
                dial10.run(FadeIn)
            case 1:
                dial11.alpha = 1
                dial10.run(sequence)
            case 2:
                dial12.alpha = 1
                dial11.run(sequence)
            case 3:
                dial12.run(sequencebye)
                tapimg.run(FadeOut)
                pressed = 0
                
                brownie.run(self.walkAnimation)
            
                fundo.run(moverFundo2)
                museum.run(moverMonumento)
                template3.run(moverTemplate)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + (secondsToDelay)) {
                    self.brownie.run(self.idleAnimation)
                    self.callButton()
                }
                
                dialogue3 = false
                cutscene = false
    
            default:
                print("acabou3")
                break
            }
        }
    }
    
    func dialogueScene4() {
        let transitionTime = SKAction.wait(forDuration: 1)
        let sequence = SKAction.sequence([transitionTime, bye])
        let sequencebye = SKAction.sequence([FadeOut, transitionTime, bye])
        
        if pressed <= 12 {
            switch pressed {
            case 0:
                dial13.run(FadeIn)
            case 1:
                dial14.alpha = 1
                dial13.run(sequence)
            case 2:
                dial14.run(sequence)
                //callIsa()
            case 3:
                dial15.run(FadeIn)
                dial14.run(sequence)
            case 4:
                dial16.run(FadeIn)
                dial15.run(FadeOut)
            case 5:
                dial17.run(FadeIn)
                dial16.run(FadeOut)
            case 6:
                dial18.run(FadeIn)
                dial17.run(FadeOut)
            case 7:
                dial19.alpha = 1
                dial18.run(FadeOut)
            case 8:
                dial20.run(FadeIn)
                dial19.run(FadeOut)
            case 9:
                dial21.run(FadeIn)
                dial20.run(FadeOut)
            case 10:
                dial22.run(FadeIn)
                dial21.run(FadeOut)
            case 11:
                dial22.run(sequencebye)
            case 12:

                tapimg.run(FadeOut)
                pressed = 0
                
                endImage.run(FadeIn)
                icone.run(FadeIn)

                dialogue4 = false
                cutscene = false
                pressed = 0
    
            default:
                print("acabou4")
                break
            }
        }
    }
    
    
    // Essa parte cuida de monitorar os toques ou cliques na tela. Cada vez que isso acontece essa função chama a nossa outra função touchDown passando a posição exata do toque na tela. Normalmente não precisamos mexer aqui.
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                for t in touches { self.touchDown(atPoint: t.location(in: self)) }
            }
    override func touchesMoved(_ touches: Set<UITouch>, with _: UIEvent?){
        for t in touches {
            touchMoved(toPoint: t.location(in: self))
        }
    }
    
    func touchMoved(toPoint point: CGPoint) {
        
        checkPassedPoints(pos: point)
        
        if canDraw == true {
            if point == previousLocation {
                return
            }
            
            path.addLine(to: point)
            if let pathNode = pathNodes.last{
                pathNode.path = path
            }
                        
            previousLocation = point
        }
    }
    
    func checkPassedPoints(pos: CGPoint) {
        let secondsToDelay = 0.1
        
        for (point, passed) in passedPoints where !passed {
            if point.contains(pos) {
                passedPoints[point] = true
                point.setScale(1.3)
                DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                    point.setScale(1.6)
                    DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                        point.alpha = 0
                        self.popSounds()
                    }
                }
            }
        }
        
        let notPassedCount = passedPoints.filter({$0.value == false}).count
        
        if notPassedCount == 0 {
            //Faz a ação de por a imagem na tela
            for (point, _) in passedPoints {
                point.removeFromParent()
            }
            
            for pathNode in pathNodes {
                pathNode.removeFromParent()
            }
            
            if canDraw == true {
                
                canDraw = false
                pathNodes.removeAll()
                passedPoints.removeAll()
                
                switch fase {
                case 1:
                    template1.removeFromParent()
                    catDone()
                    byeCloserBrownie()
                    callBrownie()
                case 2:
                    template2.removeFromParent()
                    monDone()
                    byeCloserBrownie()
                    callBrownie()
                case 3:
                    template3.removeFromParent()
                    botDone()
                    byeCloserBrownie()
                    callBrownie()
                default:
                    print("algo deu errado :0")
                }
                
            }
        }
    }
    
}
    

// ???
enum BrownieStatus {
    case idle
    case walking
}
