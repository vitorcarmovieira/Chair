//
//  GuiaViewController.swift
//  Wchair
//
//  Created by Vitor on 6/15/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData

class GuiaViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        //imagens dos exercicios
        var imageAbracoBola = UIImagePNGRepresentation(UIImage (named: "AbracoBola"));
        var imageApoioBola = UIImagePNGRepresentation(UIImage (named: "ApoioBola"));
        var imageCrucifixoPolia = UIImagePNGRepresentation(UIImage (named: "CrucifixoPolia"));
        var imageDesenvolvimentoHalteres = UIImagePNGRepresentation(UIImage (named: "DesenvolvimentoHalteres"));
        var imageElasticoTensao = UIImagePNGRepresentation(UIImage (named: "ElasticoTensao"));
        var imageElevacaoHalteres = UIImagePNGRepresentation(UIImage (named: "ElevacaoHalteres"));
        var imageElevacaoLateral = UIImagePNGRepresentation(UIImage (named: "ElevacaoLateral"));
        var imageExtensaoQuadril = UIImagePNGRepresentation(UIImage (named: "ExtensaoQuadril"));
        var imagePulleyCorda = UIImagePNGRepresentation(UIImage (named: "PulleyCorda"));
        var imagePulleyTriceps = UIImagePNGRepresentation(UIImage (named: "PulleyTriceps"));
        var imagePuxadorAltoAtrasNuca = UIImagePNGRepresentation(UIImage (named: "PuxadorAltoAtrasNuca"));
        var imagePuxadorFechado = UIImagePNGRepresentation(UIImage (named: "PuxadorFechado"));
        var imagePuxadorHorizontal = UIImagePNGRepresentation(UIImage (named: "PuxadorHorizontal"));
        var imagePuxadorVertical = UIImagePNGRepresentation(UIImage (named: "PuxadorVertical"));
        var imageRoscaIndividual = UIImagePNGRepresentation(UIImage (named: "RoscaIndividual"));
        var imageRoscaMartelo = UIImagePNGRepresentation(UIImage (named: "RoscaMartelo"));
        var imageRoscaSimultanea = UIImagePNGRepresentation(UIImage (named: "RoscaSimultanea"));

        //imagens dos esportes
        var imageBasquete = UIImagePNGRepresentation(UIImage (named: "Basquete3"));
        var imageTenisMesa = UIImagePNGRepresentation(UIImage (named: "Tenis_de_mesa"));
        var imageBocha = UIImagePNGRepresentation(UIImage (named: "Bocha"));
        var imageRugby = UIImagePNGRepresentation(UIImage (named: "Rugby"));
        var imageTenis = UIImagePNGRepresentation(UIImage (named: "Tenis"));
        var imageTiroArco = UIImagePNGRepresentation(UIImage (named: "Tiro-Com-Arco"));
        var imageTiroEsportivo = UIImagePNGRepresentation(UIImage (named: "Tiro-Esportivo"));
        var imageHalterofilismo = UIImagePNGRepresentation(UIImage (named: "Halterofilismo"));
        var imageAtletismo = UIImagePNGRepresentation(UIImage (named: "Atletismo"));
        var imageEsgrima = UIImagePNGRepresentation(UIImage (named: "Esgrima"));
        var imageNatacao = UIImagePNGRepresentation(UIImage (named: "Natacao"));
        
        if let moc = self.managedObjectContext{
                        Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Braços", idEquipamento: "Bola", imageGuia: imageAbracoBola, nome: "Abraço com Bola", tempo: "5min", vezesPraticadas: 3);
            
                        Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para as Costas", idEquipamento: "Bola", imageGuia: imageApoioBola, nome: "Apoio com Bola", tempo: "5min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para as Costas", idEquipamento: "1", imageGuia: NSData(), nome: "Puxador Fechado", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Elevação Lateral", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Elástico de Tensão", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Ombros", idEquipamento: "1", imageGuia: NSData(), nome: "Desenvolvimento com Hálteres", tempo: "30min", vezesPraticadas: 45);
            //
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Bíceps", idEquipamento: "1", imageGuia: NSData(), nome: "Rosca Simultânea.", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Bíceps", idEquipamento: "1", imageGuia: NSData(), nome: "Rosca Individual Polia Alta", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Tríceps", idEquipamento: "1", imageGuia: NSData(), nome: "Pulley Tríceps", tempo: "30min", vezesPraticadas: 45);
            //
            //            Exercicio.createInManagedObjectContext(moc, animacao: NSData(), detalhes: "Exercício para os Tríceps", idEquipamento: "1", imageGuia: NSData(), nome: "Pulley Corda", tempo: "30min", vezesPraticadas: 45);

            
            Esporte.createInManagedObjectContext(moc, modalidade: "BASQUETE", descricao: "A modalidade é praticada por atletas de ambos os sexos que tenham alguma deficiência físico-motora, sob as regras adaptadas da Federação Internacional de Basquete em Cadeira de Rodas (IWBF). As cadeiras são adaptadas e padronizadas, conforme previsto na regra. No Brasil, a modalidade é administrada pela Confederação Brasileira de Basquetebol em Cadeira de Rodas (CBBC).", classificacao: "Na classificação funcional, os atletas são avaliados conforme o comprometimento físico-motor em uma escala de 1 a 4,5. Quanto maior a deficiência, menor a classe. A soma desses números na equipe de cinco pessoas não pode ultrapassar 14.", modoDisputa: "O jogador deve quicar, arremessar ou passar a bola a cada dois toques dados na cadeira. As dimensões da quadra e a altura da cesta seguem o padrão do basquete olímpico. São disputados quatro quartos de 10 minutos cada.", foto:imageBasquete );
            
            Esporte.createInManagedObjectContext(moc, modalidade: "TENIS DE MESA", descricao: "O tênis de mesa é um dos mais tradicionais esportes paralímpicos, sendo disputado desde os Jogos de Roma-1960, 28 anos antes de a modalidade estrear no programa dos Jogos Olímpicos. Todas as edições dos Jogos Paralímpicos tiveram disputas da modalidade, tanto no masculino quanto no feminino. A entidade responsável pelo tênis de mesa é a Federação Internacional de Tênis de Mesa (ITTF). No Brasil, a Confederação Brasileira de Tênis de Mesa (CBTM) é quem administra o esporte.", classificacao: "Os atletas são divididos em onze classes distintas. Mais uma vez, segue a lógica de que quanto maior o número da classe, menor é o comprometimento físico-motor do atleta. A classificação é realizada a partir da mensuração do alcance de movimentos de cada atleta, sua força muscular, restrições locomotoras, equilíbrio na cadeira de rodas e a habilidade de segurar a raquete. TT1, TT2, TT3, TT4 e TT5 – atletas cadeirantes. TT6, TT7, TT8, TT9, TT10 – atletas andantes. TT11 - atletas andantes com deficiência intelectual.", modoDisputa: "No tênis de mesa participam atletas do sexo masculino e feminino com paralisia cerebral, amputados e cadeirantes. As competições são divididas entre mesatenistas andantes e cadeirantes, com jogos individuais, em duplas ou por equipes. As partidas consistem em uma melhor de cinco sets, sendo que cada um deles é disputado até que um dos jogadores atinja 11 pontos. Em caso de empate em 10 a 10, vence quem primeiro abrir dois pontos de vantagem. Em relação ao tênis de mesa convencional, existem apenas algumas diferenças nas regras, como na hora do saque para a categoria cadeirante.", foto: imageTenisMesa);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "RUGBY", descricao: "O rugbi em cadeira de rodas nasceu na década de 70, em Winnipeg, no Canadá, e foi desenvolvido por atletas tetraplégicos. No entanto, a modalidade só foi nos Jogos Paralímpicos de Atlanta-1996, como esporte de demonstração. A estreia oficial ocorreu quatro anos depois, em Sydney-2000, no qual os Estados Unidos conquistaram a medalha de ouro, deixando a Austrália com a prata e a Nova Zelândia com o bronze. Assim como no rúgbi convencional, a modalidade para cadeirantes tem muito contato físico. São quatro atletas em cada equipe, que contam ainda com 8 reservas cada.", classificacao: "O rugbi em cadeira de rodas é praticado por atletas tetraplégicos dos sexos masculino e feminino. Os jogadores são categorizados em sete classes a depender da habilidade funcional: 0,5; 1,0; 1,5; 2,0; 2,5; 3,0 e 3,5. As classes superiores são destinadas aos atletas que têm maiores níveis funcionais e as classes mais baixas são para jogadores de menor funcionalidade. A classificação é baseada nos seguintes componentes: Teste de banco: teste muscular realizado em toda a extremidade da musculatura superior, além do exame do alcance do movimento, tônus e sensação; Teste funcional do tronco: é realizada uma avaliação do tronco e das extremidades inferiores em todos os planos e situações, que pode incluir um teste manual da musculatura do tronco; Testes de movimentação funcional.", modoDisputa: "Os jogos ocorrem em quadras de 15m de largura por 28m de comprimento e têm 4 períodos de 8 minutos. O objetivo é passar da linha do gol com as duas rodas da cadeira e a bola nas mãos. O curioso do rúgbi em cadeira de rodas é que ele não é dividido por gênero. Homens e mulheres jogam juntos em uma categoria mista. Estão aptos a disputar a modalidade atletas que sejam comprovadamente tetraplégicos, que são divididos em classes de acordo com a habilidade funcional.", foto: imageRugby);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "TIRO COM ARCO", descricao: "O tiro com arco é uma das mais tradicionais modalidades dos Jogos Paralímpicos e está presente no programa desde 1960, nos jogos de Roma (ITA). A história do esporte é ainda mais antiga. No meio da década de 1940, na Inglaterra, por ideia do neurologista alemão Ludwig Guttmann, a modalidade começou a ser praticada como atividade de recreação e recuperação de feridos da Segunda Guerra Mundial. Em 1948, a primeira competição de tiro com arco para paraplégicos foi disputada em Stoke Mandeville (ING). Uma característica marcante, e até inusitada do tiro com arco em Jogos Paralímpicos é que as provas foram disputadas por homens e mulheres desde o início. Ao contrário da história de diversas outras modalidades, que começaram com disputas exclusivamente masculinas, o tiro com arco incluiu as mulheres desde seus primeiros passos. A modalidade é organizada pela Federação Internacional de Tiro com Arco (WA, em inglês). Em 2007, a entidade assumiu o comando da disciplina, que até então estava com o Comitê Paralímpico Internacional (IPC, em inglês).", classificacao: "engloba aqueles que não possuem deficiência nos braços, mas possuem grau de perda de força muscular nas pernas, de coordenação ou mobilidade articular. Na ARST, o atleta pode atirar sentado em uma cadeira normal, com os pés no chão ou em pé. A ARW1 é para atletas com deficiência nos braços e nas pernas, com alcance limitado de movimentos, de força, de controle dos braços e pouco ou nenhum controle do tronco. Já a ARW2 é para aqueles que possuem paraplegia e mobilidade articular limitada nos membros inferiores e que precisam da cadeira de rodas para uso diário.", modoDisputa: "O Tiro com Arco paralímpico pode ser disputado por pessoas com amputações, paraplégicos e tetraplégicos, paralisia cerebral, doenças disfuncionais e progressivas, como a atrofia muscular e escleroses, com disfunções nas articulações, problemas na coluna e múltiplas-deficiências. Além das provas individuais, a modalidade ainda conta com a disputa por equipes, com três arqueiros em cada time. As regras do Tiro com Arco paralímpico são as mesmas do esporte olímpico. Os participantes têm como objetivo acertar as flechas o mais perto possível do alvo, que está colocado a uma distância de 70m e tem 1,22m de diâmetro, formado por dez círculos concêntricos. O mais externo vale um ponto, e o central vale dez. Quanto mais próxima do círculo central estiver a flecha, maior a pontuação obtida.", foto: imageTiroArco);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "TIRO ESPORTIVO", descricao: "O tiro esportivo estreou nos Jogos Paralímpicos em 1976, em Toronto. Porém, até chegar ao formato de disputa atual, passou por algumas mudanças durante os ciclos. Em Toronto, apenas os homens competiram. Quatro anos depois, em Arnhem, Holanda, as mulheres entraram na disputa, inclusive em provas mistas. Em 1984 (Stoke Mandeville e Nova York) e 1988 (Seoul), as provas mistas foram retiradas do programa, voltando apenas em 1992, em Barcelona, substituindo a prova feminina. Quatro anos depois, em Atlanta, os três tipos de disputas foram fixadas novamente nos Jogos. No Brasil, o tiro esportivo começou a ser praticado em 1997, no Centro de Reabilitação da Polícia Militar do Rio de Janeiro. Em 2002, o Comitê Paralímpico Brasileiro investiu na modalidade para aumentar o número de praticantes no Brasil. A iniciativa deu resultado já no ano seguine, e o trio brasileiro formado por Carlos Strub, Cillas Viana e Walter Calixto conquistou uma medalha de bronze na disputa por equipes no Aberto de Apeldoorn, na Holanda.", classificacao: "O tiro utiliza um sistema de classificação funcional que permite que atletas com diferentes tipos de deficiência possam competir juntos, tanto no individual como por equipes. Dependendo das limitações existentes (grau de funcionalidade do tronco, equilíbrio sentado, força muscular, mobilidade de membros superiores e inferiores), e das habilidades que são requeridas no tiro, os atletas são divididos em três classes: SH1, SH2 e SH3. Mas as competições paraolímpicas incluem apenas as classes SH1 e SH2. A diferença básica entre SH1 e SH2 é que atletas da SH2 podem usar suporte especial para a arma, que obedecem às especificações do IPC. Os atletas da SH3 possuem debilitação visual. A classificação do Tiro é dividida em três classes principais: SH1: atiradores de pistola e rifle que não requerem suporte para a arma; SH2: atiradores de rifle que não possuem habilidade para suportar o peso da arma com seus braços e precisam de um suporte para a arma; SH3: atiradores de Rifle com deficiência visual.", modoDisputa: "As regras das competições têm apenas algumas adaptações. Pessoas amputadas, paraplégicas, tetraplégicas e com outras deficiências locomotoras podem competir nas classes SH1 (deficiência baixa, sem necessidade de apoiar a arma) e SH2 (deficiência mais aguda, com necessidade de apoio para a arma). Deficientes visuais competem na classe SH3. O alvo é dividido em dez circunferências que valem de um a dez pontos. Em finais olímpicas, os dois círculos menores (9 e 10 pontos) ainda têm pontuação decimal. Neste caso, é possível fazer, com apenas um tiro, a pontuação equivalente a 10,9 pontos. Rifles e pistolas de ar, com cartuchos de 4.5mm, são utilizados nas provas de 10 metros de distância. Já nos 25 metros, uma pistola de perfuração é utilizada com projéteis de 5.6mm. Rifles de perfuração e pistolas são as armas das provas de 50m, também com as balas de 5.6mm de diâmetro.", foto: imageTiroEsportivo);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "HALTEROFILISMO", descricao: "O halterofilismo apareceu pela primeira vez em uma edição de Jogos Paralímpicos, em 1964, em Tóquio (JAP). A deficiência dos atletas era apenas com lesões na coluna vertebral. Até os Jogos de Atlanta (1996), somente os homens competiam. Quatro anos depois, em Sydney, as mulheres entraram de vez para a modalidade. Atualmente, 109 países possuem halterofilistas paralímpicos.", classificacao: "O objetivo da classificação é facilitar o desenvolvimento de um sistema  baseado em evidências. A finalidade do sistema é promover a participação no desporto por pessoas com deficiência, minimizando o impacto da deficiência ou incapacidade, para um resultado justo e equitativo da competição, determinando assim a elegibilidade para competir. As deficiências elegíveis para competir no Halterofilismo são: Deficiência de membros inferiores; Diferença de comprimento de membro inferior (7cm); Deficiência de força muscular; Deficiência de amplitude de movimento; Ataxia; Hipertonia; Atetose; Nanismo (Acondroplasia).", modoDisputa: "No halterofilismo, os atletas permanecem deitados em um banco, e executam um movimento conhecido como supino. A prova começa no momento em que a barra de apoio é retirada – com ou sem a ajuda do auxiliar central – deixando o braço totalmente estendido.  O atleta flexiona o braço descendo a barra até a altura do peito. Em seguida, elevam-na até a posição inicial, finalizando o movimento. Hoje, competem atletas com deficiência física nos membros inferiores ou paralisia cerebral. As categorias são subdivididas pelo peso corporal de cada um. São dez categorias femininas e dez masculinas. O atleta pode realizar o movimento três vezes, e o maior peso é validado. Os árbitros ficam atentos à execução contínua do movimento e à parada nítida da barra no peito. No Brasil, a modalidade é organizada pelo Comitê Paralímpico Brasileiro por meio da Coordenação de Halterofilismo.", foto: imageHalterofilismo);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "ATLETISMO", descricao: "O atletismo faz parte do programa dos Jogos Paralímpicos desde a primeira edição, em Roma-1960. Mas foi apenas em 1984 que o Brasil conquistou as primeiras medalhas, em Nova Iorque (Estados Unidos) e em Stoke Mandeville (Inglaterra). Naquele ano, o país faturou seis medalhas de ouro, 12 de prata e três de bronze na modalidade.", classificacao: "Field(Campo) F31 a F34 para cadeirantes. Track(Pista) T31 a T34 para cadeirantes", modoDisputa: "O atletismo paralímpico é praticado por atletas com deficiência física ou visual. Há provas de corrida, saltos, lançamentos e arremessos, tanto no feminino quanto no masculino. Os competidores são divididos em grupos de acordo com o grau de deficiência constatado pela classificação funcional. Nas corridas, os atletas com deficiência visual mais alta podem ser acompanhados por guias, ligados a eles por uma corda. Já entre os deficientes físicos, há corridas com o uso de próteses ou em cadeiras de rodas.", foto: imageAtletismo);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "ESGRIMA", descricao: "Destinada a atletas com deficiência locomotora, a esgrima adaptada surgiu em 1953 e foi aplicada originalmente pelo médico alemão Ludwig Guttmann, o pai do movimento paralímpico. A modalidade, uma das mais tradicionais, é disputada desde a primeira edição dos Jogos Paralímpicos, em Roma-1960. A disputa segue as regras da Federação Internacional de Esgrima (FIE), mas é administrada pelo Comitê Executivo de Esgrima do Comitê Paralímpico Internacional (IPC).", classificacao: "Os atletas são avaliados a partir de testes de extensão da musculatura dorsal, da avaliação do equilíbrio lateral com membros superiores abduzidos com e sem a arma, da extensão da musculatura dorsal com as mãos atrás do pescoço, entre outros. Classe 1A - Atletas sem equilíbrio sentado, que têm limitações no braço armado, não possuem extensão eficiente do cotovelo em relação à gravidade e não possuem função residual da mão, fazendo com que seja necessário fixar a arma com uma atadura. É comparável à antiga ISMGF 1A, ou tetraplégicos com lesões espinhais no nível da C5/C6. Classe 1B - Atletas sem equilíbrio sentado e com limitações no braço armado. Há extensão funcional do cotovelo mas não há flexão dos dedos. A arma precisa ser fixada com uma bandagem. É comparável ao nível completo de tetraplegia no nível da C7/C8 ou lesão incompleta superior. Classe 2 - Atletas com total equilíbrio sentado e braço armado normal, com paraplegia do tipo T1/T9 ou tetraplegia incompleta com sequelas mínimas no braço armado e bom equilíbrio sentado. Classe 3 - Atletas com bom equilíbrio sentado, sem suporte de pernas e braço armado normal, como paraplégicos da T10 à L2. Atletas tanto com pequenos resquícios de amputação abaixo do joelho ou lesões incompletas abaixo da D10 ou deficiências comparáveis podem ser incluídos nesta classe, desde que as pernas ajudem na manutenção do equilíbrio sentado. Classe 4 - Atletas com um bom equilíbrio sentado e com suporte das extremidades superiores e braço armado normal, como lesões abaixo da C4 ou deficiências comparáveis. Limitações mínimas - Deficiência dos membros inferiores comparável a amputações abaixo do joelho.", modoDisputa: "Em competição, as pistas medem 4m de comprimento por 1,5m de largura, e as cadeiras de rodas ficam fixas ao chão. Se um dos esgrimistas mover a cadeira, o combate é interrompido. Há duelos de florete, espada e sabre. Para cada prova, há uma proteção específica para o competidor e para as cadeiras, além de regras para a pontuação ser validada.", foto: imageEsgrima);
            
            Esporte.createInManagedObjectContext(moc, modalidade: "NATAÇÃO", descricao: "A natação faz parte do programa oficial desde os primeiros Jogos Paralímpicos, em Roma-1960. Na modalidade, competem atletas com diversos tipos de deficiência (física e visual) nos quatro estilos: livre, costas, medley e peito. As provas são divididas na categoria masculino e feminino, seguindo as regras do IPC Swimming, órgão responsável pela natação no Comitê Paralímpico Internacional (IPC).", classificacao: "sem classificação ainda", modoDisputa: "As adaptações são feitas nas largadas, viradas e chegadas. Os nadadores cegos recebem um aviso do tapper, por meio de um bastão com ponta de espuma quando estão se aproximando das bordas. A largada também pode ser feita na água, no caso de atletas de classes mais baixas, que não conseguem sair do bloco. As baterias são separadas de acordo com o grau e o tipo de deficiência. No Brasil, a modalidade é administrada pelo Comitê Paralímpico Brasileiro (CPB).", foto: imageNatacao);
            
         
            
           
        }
        
        //self.save();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch (segue.identifier)!{ //falta fazer um where para pegar os tipos de cada segue 😊
            
        case "tipo1":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
                view.tag = 1
            }
        case "tipo2":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
                view.tag = 2
            }
        case "tipo3":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
                view.tag = 3
            }
        case "tipo4":
            var view = segue.destinationViewController as! GuiaTableViewController
            let fetchRequest = NSFetchRequest(entityName: "Exercicio")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Exercicio] {
                
                view.guiaItems = fetchResults
                view.tag = 4
            }
        default:
            println("segue não identificada")
        }
    }
    
    func save() {
        var error : NSError?
        if(managedObjectContext!.save(&error) ) {
            println(error?.localizedDescription)
        }
    }

}
